
//  Created by HongWeicheng.
//

#import "WallNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation WallNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"Wall %p", self];
        self.alpha = 0.5;
        [self initNodeGraph];
        [self initPhysicsBody];
    }
    return self;
}

- (void)initNodeGraph {

}

- (void)initPhysicsBody {
    SKPhysicsBody *body = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10,10)];
    body.affectedByGravity = NO;
    body.dynamic = NO;
    self.physicsBody = body;
}


@end
