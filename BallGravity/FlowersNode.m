
//  Created by HongWeicheng.
//

#import "FlowersNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation FlowersNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"FlowersFather %p", self];
        [self initNodeGraph];
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *flowersTexture = [SKTexture textureWithImageNamed:@"三枝梅花0"];
    SKSpriteNode *flowers = [SKSpriteNode spriteNodeWithTexture:flowersTexture];
    flowers.name = [NSString stringWithFormat:@"flowers"];
    
    self.textureArray = [NSMutableArray new];
    for (int i=0; i<=8; i++) {
        NSString *iString = [NSString stringWithFormat:@"%d",i];
        NSString *longTextureImageNameString = [NSString stringWithFormat:@"三枝梅花%@",iString];
        SKTexture *longTexture = [SKTexture textureWithImageNamed:longTextureImageNameString];
        [self.textureArray addObject:longTexture];
    }
    SKAction *flowersAction = [self flowersDance];
    
    [flowers runAction:flowersAction withKey:@"花儿随风舞蹈"];
    [self addChild:flowers];
}
//花儿随风舞蹈
- (SKAction *)flowersDance {
    SKAction *animate = [SKAction animateWithTextures:self.textureArray timePerFrame:0.035];
    SKAction *animateReversed = [animate reversedAction];
    SKAction *sequence = [SKAction sequence:@[animate,animateReversed]];
    SKAction *repeatAnimation = [SKAction repeatActionForever:sequence];
    repeatAnimation.timingMode = SKActionTimingEaseInEaseOut;

    return repeatAnimation;
}

@end
