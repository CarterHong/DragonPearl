
//  Created by HongWeicheng.
//

#import "SelectLevelNode.h"
#import "Geometry.h"
#import "ZPositionCategories.h"
#import "ConfigPartDefine.h"

@implementation SelectLevelNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"Button %p", self];
        self.userInteractionEnabled = NO;
        [self initNodeGraph];
        [self initLevelNodes];
    }
    return self;
}

- (void)initNodeGraph {
    
    CGRect shapeRect = CGRectMake(-300, -160, 600, 320);
    SKShapeNode *shapeNode = [SKShapeNode shapeNodeWithRect:shapeRect cornerRadius:10];
    shapeNode.fillColor = [SKColor blackColor];
    shapeNode.strokeColor = [SKColor blackColor];
    shapeNode.alpha = 0.5;
    if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch||IPAD_11dian0_inch) {
//        self.xScale = 1.3;
//        self.yScale = 1.3;
        self.xScale = 0.8;
        self.yScale = 0.8;
        [self addChild:shapeNode];
    }
    else if (IPAD_12dian9_inch) {
//        self.xScale = 1.5;
//        self.yScale = 1.5;
        self.xScale = 0.9;
        self.yScale = 0.9;
        [self addChild:shapeNode];
    }
    else {
        self.xScale = 0.8;
        self.yScale = 0.8;
        [self addChild:shapeNode];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"摸了 selectLevelNode");
}

- (void)initLevelNodes {
    
    CGFloat xPositionlevelNode = 270.0;
    CGFloat yPositionlevelNode = 128.0;
    NSMutableArray *sandBoxDataArray = [self getDataFromPlist];
    
    for (NSInteger i=0; i<5; i++) {
        for (NSInteger j=0; j<10; j++) {
            NSInteger number = i * 10 +j;
            NSDictionary *item = sandBoxDataArray[number];
            NSString *itemColor = [item objectForKey:@"color"];
            
            SKLabelNode *labelNode = [[SKLabelNode alloc] init];
            labelNode.fontSize = 30.0;
            labelNode.fontColor = [SKColor whiteColor];
            labelNode.colorBlendFactor = 1.0;
            labelNode.text = [NSString stringWithFormat:@"%ld",(long)(number + 1)];
            labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
            labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
            labelNode.zPosition = ZPositionLevelLabelCategory;
            labelNode.alpha = 1;
            
            if ([itemColor isEqualToString:@"white"]) {
                WhiteLevelNode *levelNode = [[WhiteLevelNode alloc] init];
                levelNode.position = CGPointMake(-xPositionlevelNode, yPositionlevelNode);
                levelNode.xScale = 0.8;
                levelNode.yScale = 0.8;
                levelNode.alpha = 0.6;
                [levelNode addChild:labelNode];
                [self addChild:levelNode];
            }
            else if ([itemColor isEqualToString:@"red"]) {
                RedLevelNode *levelNode = [[RedLevelNode alloc] init];
                levelNode.position = CGPointMake(-xPositionlevelNode, yPositionlevelNode);
                levelNode.xScale = 0.8;
                levelNode.yScale = 0.8;
                levelNode.alpha = 0.6;
                [levelNode addChild:labelNode];
                [self addChild:levelNode];
            }
            else {
                BlackLevelNode *levelNode = [[BlackLevelNode alloc] init];
                levelNode.position = CGPointMake(-xPositionlevelNode, yPositionlevelNode);
                levelNode.xScale = 0.8;
                levelNode.yScale = 0.8;
                levelNode.alpha = 0.6;
                [levelNode addChild:labelNode];
                [self addChild:levelNode];
            }
            xPositionlevelNode -= 60;
        }
        xPositionlevelNode = 270.0;
        yPositionlevelNode -= 64;
    }
    
}

- (NSMutableArray *)getDataFromPlist{
    //沙盒获取路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"sandBoxData.plist"];//没有会自动创建
    NSLog(@"file patch%@",filePatch);
    NSMutableArray *sandBoxDataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePatch];

    NSLog(@"get sandBox %@",sandBoxDataArray);//直接打印数据
    return sandBoxDataArray;
}


@end
