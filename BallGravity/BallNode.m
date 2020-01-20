
//  Created by HongWeicheng.
//

#import "BallNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation BallNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"Ball %p", self];
        [self initNodeGraph];
        [self initPhysicsBody];
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *ballTexture = [SKTexture textureWithImageNamed:@"colorball"];
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithTexture:ballTexture];
    [self addChild:ball];
}

- (void)initPhysicsBody {
    SKPhysicsBody *body = [SKPhysicsBody bodyWithCircleOfRadius:10.0];
    body.affectedByGravity = YES;
    self.physicsBody = body;
}






@end
