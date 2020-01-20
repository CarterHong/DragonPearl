
//  Created by HongWeicheng.
//

#import "DenLongNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation DenLongNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"DenLongFather %p", self];
        [self initNodeGraph];
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *dengLongTexture = [SKTexture textureWithImageNamed:@"灯笼梅花0"];
    SKSpriteNode *dengLong = [SKSpriteNode spriteNodeWithTexture:dengLongTexture];
    dengLong.name = [NSString stringWithFormat:@"denglong"];
    
    self.textureArray = [NSMutableArray new];
    for (int i=0; i<=3; i++) {
        NSString *iString = [NSString stringWithFormat:@"%d",i];
        NSString *dengLongTextureImageNameString = [NSString stringWithFormat:@"灯笼梅花%@",iString];
        SKTexture *dengLongTexture = [SKTexture textureWithImageNamed:dengLongTextureImageNameString];
        [self.textureArray addObject:dengLongTexture];
    }
    SKAction *dengLongAction = [self dengLongDance];
    
    [dengLong runAction:dengLongAction withKey:@"花儿随风舞蹈"];
    [self addChild:dengLong];
}
//灯笼闪光
- (SKAction *)dengLongDance {
    SKAction *animate = [SKAction animateWithTextures:self.textureArray timePerFrame:0.5];
    SKAction *sequence = [SKAction sequence:@[animate]];
    SKAction *repeatAnimation = [SKAction repeatActionForever:sequence];
    repeatAnimation.timingMode = SKActionTimingEaseInEaseOut;
    return repeatAnimation;
}

@end
