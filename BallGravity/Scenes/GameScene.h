//
//  GameScene.h
//  BallGravity
//
//  Copyright © 2019年 hongweicheng. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "TileMapLayer.h"
#import "ZPositionCategories.h"
#import "ShenLongNode.h"
#import "CloudNode.h"
#import "BallNode.h"
#import "PalaceNode.h"
#import "ButtonNode.h"
#import "SelectLevelNode.h"
#import "GameOverScene.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;

@property (assign, nonatomic) NSUInteger levelNumber;
@property (assign, nonatomic) NSUInteger playerLives;
@property (assign, nonatomic) BOOL finished;
@property (strong, nonatomic) PalaceNode *heavenPalace;
@property (strong,nonatomic) NSMutableArray *clouds;
@property (strong, nonatomic) NSMutableArray *balls;
@property (assign, nonatomic) CGFloat successPercent;
@property (assign, nonatomic) CGFloat oldSuccessPercent;
@property (assign, nonatomic) CGFloat ballCount;
@property (strong, nonatomic) SelectLevelNode *selectLevelNode;

+(instancetype)sceneWithSize:(CGSize)size levelNumber:(NSUInteger)levelNumber;

@end
