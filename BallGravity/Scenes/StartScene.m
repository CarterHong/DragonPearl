
//  Created by HongWeicheng.
//

#import "StartScene.h"
#import "GameScene.h"
#import "GameOverScene.h"

@implementation StartScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        
        FlowersNode *flowers = [[FlowersNode alloc] init];
        if (IPhoneX) {
            flowers.position = CGPointMake(self.frame.size.width * 0.7,
                                           self.frame.size.height * 0.5);
        }
        else if (iPhoneXr) {
            flowers.position = CGPointMake(self.frame.size.width * 0.75,
                                           self.frame.size.height * 0.5);
        }
        else if (iPhoneXsMax) {
            flowers.position = CGPointMake(self.frame.size.width * 0.75,
                                           self.frame.size.height * 0.5);
        }
        else if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch) {
            flowers.position = CGPointMake(self.frame.size.width * 0.67,
                                           self.frame.size.height * 0.55);
        }
        else if (IPAD_12dian9_inch){
            flowers.position = CGPointMake(self.frame.size.width * 0.67,
                                           self.frame.size.height * 0.65);
        }
        else if (IPAD_11dian0_inch){
            flowers.position = CGPointMake(self.frame.size.width * 0.67,
                                           self.frame.size.height * 0.55);
        }
        else {
            flowers.position = CGPointMake(self.frame.size.width * 0.67,
                                           self.frame.size.height * 0.5);
        }
        
        flowers.zPosition = 1;
        if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch) {
            [flowers setScale:0.5];
        }
        else if (IPAD_12dian9_inch) {
            [flowers setScale:0.5];
        }
        else if (IPAD_11dian0_inch) {
            [flowers setScale:0.5];
        }
        else {
            [flowers setScale:0.5];
        }
        [self addChild:flowers];
        
        SKLabelNode *topLabel = [SKLabelNode labelNodeWithFontNamed:@"Zapfino"];
        topLabel.text = @"DragonPearl";
        topLabel.fontColor = [SKColor blackColor];
        if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch||IPAD_12dian9_inch) {
            topLabel.fontSize = 80;
            topLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                            self.frame.size.height * 0.618);
            [topLabel setScale:0.5];
        }
        else if (IPAD_11dian0_inch) {
            topLabel.fontSize = 80;
            topLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                            self.frame.size.height * 0.618);
            [topLabel setScale:0.5];
        }
        else {
            topLabel.fontSize = 48;
            topLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                            self.frame.size.height * 0.618);
        }
        topLabel.zPosition = 3;
        [self addChild:topLabel];
        
        SKLabelNode *bottomLabel = [SKLabelNode labelNodeWithFontNamed:
                                    @"ChalkboardSE-Bold"];

        bottomLabel.text = @"Play";
        bottomLabel.fontColor = [SKColor whiteColor];
        if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch||IPAD_12dian9_inch) {
            bottomLabel.fontSize = 39;
            bottomLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                               self.frame.size.height * 0.33);
        }
        else if (IPAD_11dian0_inch) {
            bottomLabel.fontSize = 39;
            bottomLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                               self.frame.size.height * 0.33);
        }
        else {
            bottomLabel.fontSize = 39;
            bottomLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                               self.frame.size.height * 0.3);
        }
        bottomLabel.zPosition = 3;
        [self addChild:bottomLabel];
        
        SKTexture *moshuiTexture = [SKTexture textureWithImageNamed:@"墨水菜单按钮"];
        SKSpriteNode *moshui = [SKSpriteNode spriteNodeWithTexture:moshuiTexture];
        if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch||IPAD_12dian9_inch) {
            moshui.position = CGPointMake(self.frame.size.width * 0.55,
                                          self.frame.size.height * 0.35);
            moshui.xScale = 0.1;
            moshui.yScale = 0.1;
        }
        else if (IPAD_11dian0_inch) {
            moshui.position = CGPointMake(self.frame.size.width * 0.55,
                                          self.frame.size.height * 0.35);
            moshui.xScale = 0.1;
            moshui.yScale = 0.1;
        }
        else {
            moshui.position = CGPointMake(self.frame.size.width * 0.55,
                                          self.frame.size.height * 0.35);
            moshui.xScale = 0.1;
            moshui.yScale = 0.1;
        }

        moshui.zPosition = 2;
        [self addChild:moshui];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"龙戏珠开场音乐" ofType:@"mp3"];
        NSURL *pathURL = [NSURL fileURLWithPath:path];
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathURL error:nil];
        self.player.numberOfLoops = -1;
    }
    return self;
}

- (void)didMoveToView:(SKView *)view
{
    [self.player play];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    [self.player stop];

    SKTransition *transition = [SKTransition doorwayWithDuration:1.0];
    SKScene *game = [[GameScene alloc] initWithSize:self.frame.size];
    [self.view presentScene:game transition:transition];

    [self runAction:[SKAction playSoundFileNamed:@"敲锣声.mp3"
                               waitForCompletion:YES]];
}



@end
