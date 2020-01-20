//  Created by HongWeicheng.
//

#import "RedLevelNode.h"
#import "Geometry.h"

@implementation RedLevelNode

- (instancetype)init {
    if (self = [super init]) {

        
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *levelNodeTexture = [SKTexture textureWithImageNamed:@"正在打的关"];
    SKSpriteNode *levelNode = [SKSpriteNode spriteNodeWithTexture:levelNodeTexture];
    [self addChild:levelNode];
}

@end
