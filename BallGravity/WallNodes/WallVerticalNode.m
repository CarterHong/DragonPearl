//
//  WallVerticalNode.m
//  BallGravity
//
//  Copyright © 2019年 hongweicheng. All rights reserved.
//

#import "WallVerticalNode.h"

@implementation WallVerticalNode

- (void)initNodeGraph {
    SKTexture *wallTexture = [SKTexture textureWithImageNamed:@"砖竖向"];
    
    SKSpriteNode *wall = [SKSpriteNode spriteNodeWithTexture:wallTexture];
    [self addChild:wall];
}

@end
