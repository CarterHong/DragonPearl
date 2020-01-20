//
//  TileMapLayer.h
//  BallGravity
//
//  Copyright © 2019年 hongweicheng. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "WallNode.h"
#import "WallHorizontalNode.h"
#import "WallVerticalNode.h"
#import "ConfigPartDefine.h"
#import "BallNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface TileMapLayer : SKSpriteNode

@property (nonatomic,assign) CGSize tileSize;

@property (nonatomic,copy) NSArray *tileCode;

@property (strong, nonatomic) NSMutableArray *balls;

- (instancetype)initWithLevelNumber:(NSInteger)levelNumber;

@end

NS_ASSUME_NONNULL_END
