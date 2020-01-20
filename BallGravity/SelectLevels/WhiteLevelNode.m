
//  Created by HongWeicheng.
//

#import "WhiteLevelNode.h"
#import "Geometry.h"

@implementation WhiteLevelNode

- (instancetype)init {
    if (self = [super init]) {

        
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *levelNodeTexture = [SKTexture textureWithImageNamed:@"已经过的关"];
    SKSpriteNode *levelNode = [SKSpriteNode spriteNodeWithTexture:levelNodeTexture];
    [self addChild:levelNode];
}

@end
