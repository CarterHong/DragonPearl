//
//  TileMapLayer.m
//  BallGravity
//
//  Copyright © 2019年 hongweicheng. All rights reserved.
//

#import "TileMapLayer.h"

@implementation TileMapLayer

@synthesize balls;
//地图横着最多140个砖块，竖着最多75个砖块
- (instancetype)init {
    return [self initWithLevelNumber:1];
}

- (instancetype)initWithLevelNumber:(NSInteger)levelNumber {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"TileMapLayer %p", self];
        self.balls = [[NSMutableArray alloc] init];
        //在这里改变墙砖的大小
        if (IPAD_7dian9_9dian7_inch) {
//            self.tileSize = CGSizeMake(12.0, 12.0);
            self.tileSize = CGSizeMake(6.4, 6.4);
        }
        else if (IPAD_10dian5_inch) {
//            self.tileSize = CGSizeMake(13.8, 13.8);
            self.tileSize = CGSizeMake(6.4, 6.4);
        }
        else if (IPAD_11dian0_inch) {
//            self.tileSize = CGSizeMake(13.8, 13.8);
            self.tileSize = CGSizeMake(6.4, 6.4);
        }
        else if (IPAD_12dian9_inch) {
//            self.tileSize = CGSizeMake(15.5, 15.5);
            self.tileSize = CGSizeMake(6.4, 6.4);
        }
        else {
            self.tileSize = CGSizeMake(8.0, 8.0);
        }
        //在这里要改成加载记事本中的tileCodes
        if (IPhoneX) {
            NSString *levelNumberString = [NSString stringWithFormat:@"%ld",(long)levelNumber];
            NSString *pathString = [NSString stringWithFormat:@"iPhoneX_map_%@",levelNumberString];
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:@"txt"];
            NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            self.tileCode = [fileContents componentsSeparatedByString:@"\n"];
        }
        else if (iPhoneXr) {
            NSString *levelNumberString = [NSString stringWithFormat:@"%ld",(long)levelNumber];
            NSString *pathString = [NSString stringWithFormat:@"iPhoneXr_map_%@",levelNumberString];
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:@"txt"];
            NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            self.tileCode = [fileContents componentsSeparatedByString:@"\n"];
        }
        else if (iPhoneXsMax) {
            NSString *levelNumberString = [NSString stringWithFormat:@"%ld",(long)levelNumber];
            NSString *pathString = [NSString stringWithFormat:@"iPhoneXsMax_map_%@",levelNumberString];
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:@"txt"];
            NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            self.tileCode = [fileContents componentsSeparatedByString:@"\n"];
        }
        else if (IPHONE6Plus) {
            NSString *levelNumberString = [NSString stringWithFormat:@"%ld",(long)levelNumber];
            NSString *pathString = [NSString stringWithFormat:@"iPhone6Plus_map_%@",levelNumberString];
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:@"txt"];
            NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            self.tileCode = [fileContents componentsSeparatedByString:@"\n"];
        }
        else if (IPHONE5) {
            NSString *levelNumberString = [NSString stringWithFormat:@"%ld",(long)levelNumber];
            NSString *pathString = [NSString stringWithFormat:@"iPhone5_map_%@",levelNumberString];
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:@"txt"];
            NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            self.tileCode = [fileContents componentsSeparatedByString:@"\n"];
        }
        else {
            NSString *levelNumberString = [NSString stringWithFormat:@"%ld",(long)levelNumber];
            NSString *pathString = [NSString stringWithFormat:@"iPhone8_map_%@",levelNumberString];
            NSString *path = [[NSBundle mainBundle] pathForResource:pathString ofType:@"txt"];
            NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            self.tileCode = [fileContents componentsSeparatedByString:@"\n"];
        }
        [self nodeForCode:self.tileCode];
    }
    return self;
}

//获取砖块的位置
- (CGPoint)positionForRow:(NSInteger)row withCol:(NSInteger)col
{
    if (IPAD_7dian9_9dian7_inch) {
        //洪尉程硬编码画ipad地图了
//        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 1;
        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 10;
        CGFloat y = row * self.tileSize.height + self.tileSize.height/2 + self.tileSize.height * 8;
        return CGPointMake(x, y);
    }
    else if (IPAD_10dian5_inch) {
        //洪尉程硬编码画ipad地图了
//        CGFloat x = col * self.tileSize.width + self.tileSize.width/2;
        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 10;
        CGFloat y = row * self.tileSize.height + self.tileSize.height/2 + self.tileSize.height * 8;
        return CGPointMake(x, y);
    }
    else if (IPAD_11dian0_inch) {
//        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 2;
        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 10;
        CGFloat y = row * self.tileSize.height + self.tileSize.height/2 + self.tileSize.height * 8;
        return CGPointMake(x, y);
    }
    else if (IPAD_12dian9_inch) {
//        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 2;
        CGFloat x = col * self.tileSize.width + self.tileSize.width/2 + self.tileSize.width * 10;
        CGFloat y = row * self.tileSize.height + self.tileSize.height/2 + self.tileSize.height * 8;
        return CGPointMake(x, y);
    }
    else {
        CGFloat x = col * self.tileSize.width + self.tileSize.width/2;
        CGFloat y = row * self.tileSize.height + self.tileSize.height/2;
        return CGPointMake(x, y);
    }
}

- (void)nodeForCode:(NSArray *)tileCode
{
    NSArray *rowArray;
    NSString *colString;
    for (NSInteger i=0;i<tileCode.count ; i++) {
        rowArray = [tileCode[i] componentsSeparatedByString:@"-"];
        for (NSInteger j=0; j<rowArray.count; j++) {
            colString = rowArray[j];
            if ([colString isEqualToString:@">"]) {
                WallHorizontalNode *wall = [[WallHorizontalNode alloc] init];
                wall.position = [self positionForRow:i withCol:j];
                if (IPAD_7dian9_9dian7_inch) {
//                    wall.xScale = 1.5;
//                    wall.yScale = 1.5;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else if (IPAD_10dian5_inch) {
//                    wall.xScale = 13.8/8;
//                    wall.yScale = 13.8/8;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else if (IPAD_11dian0_inch) {
//                    wall.xScale = 13.8/8;
//                    wall.yScale = 13.8/8;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else if (IPAD_12dian9_inch) {
//                    wall.xScale = 15.5/8;
//                    wall.yScale = 15.5/8;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else {
                    [self addChild:wall];
                }
            }
            else if ([colString isEqualToString:@"v"]) {
                WallVerticalNode *wall = [[WallVerticalNode alloc] init];
                wall.position = [self positionForRow:i withCol:j];
                if (IPAD_7dian9_9dian7_inch) {
//                    wall.xScale = 1.5;
//                    wall.yScale = 1.5;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else if (IPAD_10dian5_inch) {
//                    wall.xScale = 13.8/8;
//                    wall.yScale = 13.8/8;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else if (IPAD_11dian0_inch) {
//                    wall.xScale = 13.8/8;
//                    wall.yScale = 13.8/8;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else if (IPAD_12dian9_inch) {
//                    wall.xScale = 15.5/8;
//                    wall.yScale = 15.5/8;
                    wall.xScale = 1;
                    wall.yScale = 1;
                    [self addChild:wall];
                }
                else {
                    [self addChild:wall];
                }
            }
            else if ([colString isEqualToString:@"B"]){
                BallNode *ball = [[BallNode alloc] init];
                ball.position = [self positionForRow:i withCol:j];
                if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch||IPAD_11dian0_inch||IPAD_12dian9_inch) {
//                    ball.xScale = 1.2;
//                    ball.yScale = 1.2;
                    ball.xScale = 0.6;
                    ball.yScale = 0.6;
                    [self addChild:ball];
                }
                else {
                    [self addChild:ball];
                }
                [self.balls addObject:ball];

            }

        }
        
    }
}




@end
