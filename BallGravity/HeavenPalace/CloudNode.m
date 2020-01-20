//  Created by HongWeicheng.
//

#import "CloudNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation CloudNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"Cloud %p", self];
        [self initNodeGraph];
        SKAction *animate = [SKAction scaleBy:0.9 duration:3];
        SKAction *animateReversed = [animate reversedAction];
        SKAction *sequence = [SKAction sequence:@[animate,animateReversed]];
        SKAction *repeatAnimation = [SKAction repeatActionForever:sequence];
        repeatAnimation.timingMode = SKActionTimingEaseInEaseOut;
        [self runAction:repeatAnimation];
        
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *cloudTexture = [SKTexture textureWithImageNamed:@"祥云大"];
    SKSpriteNode *cloud = [SKSpriteNode spriteNodeWithTexture:cloudTexture];
    [self addChild:cloud];
}

@end
