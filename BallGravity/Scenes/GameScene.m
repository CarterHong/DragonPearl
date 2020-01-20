//
//  GameScene.m
//  BallGravity
//
//  Copyright © 2019年 hongweicheng. All rights reserved.
//

#import "GameScene.h"
#import "math.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    TileMapLayer *_tileMapLayer;
    
}

+ (instancetype)sceneWithSize:(CGSize)size levelNumber:(NSUInteger)levelNumber {
    return [[self alloc] initWithSize:size levelNumber:levelNumber];
}


- (instancetype)initWithSize:(CGSize)size {
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"sandBoxData.plist"];//没有会自动创建
    NSLog(@"file patch%@",filePatch);
    NSMutableArray *sandBoxDataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePatch];
    if (sandBoxDataArray==nil) {
        [self setDefautlDataPlist];
    }
    NSUInteger redLevelNumber = [self selectRedLevel];
    return [self initWithSize:size levelNumber:redLevelNumber];
}

- (instancetype)initWithSize:(CGSize)size levelNumber:(NSUInteger)levelNumber {
    if (self = [super initWithSize:size]) {
        _levelNumber = levelNumber;
        _playerLives = 5;
        
        self.backgroundColor = [SKColor whiteColor];
        
        ButtonNode *button = [[ButtonNode alloc] init];
        button.position = CGPointMake(self.frame.size.width * 0.97, self.frame.size.height * 0.045);
        button.xScale = 0.7;
        button.yScale = 0.7;
        button.alpha = 0.3;
        [self addChild:button];
        
        self.motionManager = [[CMMotionManager alloc] init];
        
        [self.motionManager startDeviceMotionUpdates];
        
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
        
        [self createSceneContents];
        
        _tileMapLayer = [[TileMapLayer alloc] initWithLevelNumber:levelNumber];
        [self addChild:_tileMapLayer];
        
        self.balls = [[NSMutableArray alloc] init];
        self.balls = _tileMapLayer.balls;
        
        self.backgroundColor = [SKColor whiteColor];
        
        self.heavenPalace = [[PalaceNode alloc] init];
        self.heavenPalace.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        self.heavenPalace.zPosition = ZPositionHeavenPalace;
        [self addChild:self.heavenPalace];
        
        self.successPercent = 0.0;
        self.oldSuccessPercent = 0.0;
        
        self.ballCount = (CGFloat)[self.balls count];
        
        self.heavenPalace.checkPoint.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        self.userInteractionEnabled = NO;
        
        self.selectLevelNode = [[SelectLevelNode alloc] init];
        self.selectLevelNode.position = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
        self.selectLevelNode.zPosition = ZPositionSelectLevelCategory;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popOrDissmissSelectLevelNode) name:@"popOrDismissSelectLevelNodeNotification" object:nil];
        
    }
    return self;
}


- (void)didMoveToView:(SKView *)view {
    // Setup your scene here

}

- (void)popOrDissmissSelectLevelNode {
    
    if (!self.paused) {
        self.paused = YES;
        [self addChild:self.selectLevelNode];
    }
    else {
        self.paused = NO;
        [self removeChildrenInArray:[NSArray arrayWithObject:self.selectLevelNode]];
    }
}

- (void) createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
}


- (void)touchDownAtPoint:(CGPoint)pos {

}

- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"摸了 GameScene");
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void)update:(CFTimeInterval)currentTime {
    CMDeviceMotion *motionData = self.motionManager.deviceMotion;
    if (motionData != nil) {

        CMAcceleration gravity = motionData.gravity;
        self.physicsWorld.gravity = CGVectorMake(-gravity.y * 9.8, gravity.x * 9.8);  //这个速度我觉得玩家体验好

    }
//    self.physicsWorld.gravity = CGVectorMake(9.8,0);     //当测试iPhoneX模拟器时候，可以改成这个参数
    
//    if (self.finished) return;
//
//    [self updateBullets];
//    [self updateEnemies];
    
    if (![self checkForGameOver]) {
        [self checkForNextLevel];
    }

}

- (void)checkForNextLevel {
    NSUInteger x = 0;
    NSUInteger y = 0;
    //x个球在龙内部，y个球在龙外部，x+y=球的总数n
//    NSLog(@"神龙father 坐标 x= %f , y= %f",self.heavenPalace.shenLongFather.frame.origin.x,self.heavenPalace.shenLongFather.frame.origin.y);
//    NSLog(@"检查区域 坐标 x= %f , y= %f",self.heavenPalace.checkPoint.frame.origin.x,self.heavenPalace.checkPoint.frame.origin.y);
//    NSLog(@"天宫 坐标 x= %f , y= %f",self.heavenPalace.frame.origin.x,self.heavenPalace.frame.origin.y);
    
    for (BallNode *ball in self.balls) {
        if ([self.heavenPalace.checkPoint containsPoint:ball.position]) {
            x++;
        }
        else {
            y++;
        }
    }
    self.successPercent = x/self.ballCount;
    if (self.oldSuccessPercent != self.successPercent) {
        if (self.successPercent == 0) {
            [self.heavenPalace.shenLongFather changeToSlowWalk];
        }
        else if (self.successPercent >0 && self.successPercent < 1) {
            [self.heavenPalace.shenLongFather changeToQuickRun];
        }
        else if (self.successPercent >= 1){
            [self goToNextLevel];
        }
        self.oldSuccessPercent = self.successPercent;
    }
}

- (void)goToNextLevel {
    NSLog(@"过关了");
    self.finished = YES;
    
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    label.text = @"Level Complete!";
    label.fontColor = [SKColor blueColor];
    label.fontSize = 32;
    label.position = CGPointMake(self.frame.size.width * 0.5,
                                 self.frame.size.height * 0.5);
    [self addChild:label];
    
    [self writeDataToPlist:self.levelNumber];
    
    if (self.levelNumber != 50) {
        GameScene *nextLevel = [[GameScene alloc]
                                initWithSize:self.frame.size
                                levelNumber:self.levelNumber + 1];
        
        [self runAction:[SKAction playSoundFileNamed:@"胜利音乐.mp3"
                                   waitForCompletion:YES]];
        
        [self.view presentScene:nextLevel
                     transition:[SKTransition flipHorizontalWithDuration:2.0]];
    }
    else {
        GameOverScene *gameOver = [[GameOverScene alloc] initWithSize:self.frame.size];
        [self runAction:[SKAction playSoundFileNamed:@"胜利音乐.mp3"
                                   waitForCompletion:YES]];
        [self.view presentScene:gameOver
                     transition:[SKTransition flipHorizontalWithDuration:2.0]];
    }

}

- (void)triggerGameOver {

}

- (BOOL)checkForGameOver {
//    if (self.playerLives == 0) {
//        [self triggerGameOver];
//        return YES;
//    }
    return NO;
}

- (void)setDefautlDataPlist {
    //沙盒获取路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"sandBoxData.plist"];
    NSMutableArray *sandBoxDataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePatch];

    sandBoxDataArray = [NSMutableArray new];
    [sandBoxDataArray addObject:[NSDictionary dictionaryWithObject:@"red" forKey:@"color"]];
    
    for (int i=1; i<50; i++) {
        NSDictionary *item = [NSDictionary dictionaryWithObject:@"black" forKey:@"color"];
        [sandBoxDataArray addObject:item];
    }
    
    NSLog(@"default sandbox %@",sandBoxDataArray);
    
    [sandBoxDataArray writeToFile:filePatch atomically:YES];
    
}

- (NSMutableArray *)getDataFromPlist{
    //沙盒获取路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"sandBoxData.plist"];//没有会自动创建
    NSLog(@"file patch%@",filePatch);
    NSMutableArray *sandBoxDataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePatch];
    if (sandBoxDataArray==nil) {
        [self setDefautlDataPlist];
    }
    NSLog(@"get sandBox %@",sandBoxDataArray);//直接打印数据
    return sandBoxDataArray;
}

- (void)writeDataToPlist:(NSUInteger)levelNumber{
    //这里使用位于沙盒的plist（程序会自动新建的那一个）
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"sandBoxData.plist"];
    NSMutableArray *sandBoxDataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePatch];
    NSLog(@"old sandBox before writing is %@",sandBoxDataArray);
    
    if (levelNumber < 50) {
        [sandBoxDataArray[levelNumber - 1] setObject:@"white" forKey:@"color"];
        [sandBoxDataArray[levelNumber] setObject:@"red" forKey:@"color"];
    }
    else {
        [sandBoxDataArray[levelNumber - 1] setObject:@"white" forKey:@"color"];
    }
    
    [sandBoxDataArray writeToFile:filePatch atomically:YES];
    NSLog(@"new sandBox after writing is %@",sandBoxDataArray);
    
}

- (NSUInteger)selectRedLevel {
    NSUInteger redLevelNumber = 1;
    NSMutableArray *levelsArray = [self getDataFromPlist];
    
    for (NSUInteger i=0; i<50; i++) {
        NSDictionary *item = levelsArray[i];
        NSString *itemColor = [item objectForKey:@"color"];
        if ([itemColor isEqualToString:@"red"]) {
            redLevelNumber = i + 1;
            break;
        }
    }
    return redLevelNumber;
}

@end
