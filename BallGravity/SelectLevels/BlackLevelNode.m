
//  Created by HongWeicheng.
//

#import "BlackLevelNode.h"
#import "Geometry.h"

@implementation BlackLevelNode

- (instancetype)init {
    if (self = [super init]) {
        
        
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *levelNodeTexture = [SKTexture textureWithImageNamed:@"没过的关"];
    SKSpriteNode *levelNode = [SKSpriteNode spriteNodeWithTexture:levelNodeTexture];
    [self addChild:levelNode];
}

@end
