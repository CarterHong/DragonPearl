//
//  WallHorizontalNode.m
//  BallGravity
//
//  Copyright © 2019年 hongweicheng. All rights reserved.
//

#import "WallHorizontalNode.h"

@implementation WallHorizontalNode

- (void)initNodeGraph {
        SKTexture *wallTexture = [SKTexture textureWithImageNamed:@"砖横向"];
        SKSpriteNode *wall = [SKSpriteNode spriteNodeWithTexture:wallTexture];
        [self addChild:wall];
}

@end
