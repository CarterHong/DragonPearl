
//  Created by HongWeicheng.
//

#import "CheckPointNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation CheckPointNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"CheckPoint %p", self];
        [self initNodeGraph];
    }
    return self;
}

- (void)initNodeGraph {
    //此处监测半径是硬编码的，要小心
    SKShapeNode *checkPoint = [SKShapeNode shapeNodeWithCircleOfRadius:60.0];
    [self addChild:checkPoint];
}


@end
