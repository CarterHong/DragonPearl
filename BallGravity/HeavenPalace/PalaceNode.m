
//  Created by HongWeicheng.
//

#import "PalaceNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation PalaceNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"天宫 %p", self];
        [self initNodeGraph];
        
    }
    return self;
}

- (void)initNodeGraph {
    
    self.shenLongFather = [[ShenLongNode alloc] init];
    self.shenLongFather.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    self.shenLongFather.zPosition = ZPositionLongCategory;
    [self addChild:self.shenLongFather];
    
    CloudNode *cloudBigFront = [[CloudNode alloc] init];
    cloudBigFront.position = CGPointMake(self.shenLongFather.position.x + 50, self.shenLongFather.position.y - 50);
    cloudBigFront.zPosition = FrontCloudCategory;
    [cloudBigFront setScale:0.2];
    [self addChild:cloudBigFront];
    
    CloudNode *cloudSmallFront = [[CloudNode alloc] init];
    cloudSmallFront.position = CGPointMake(self.shenLongFather.position.x - 50, self.shenLongFather.position.y + 50);
    cloudSmallFront.zPosition = FrontCloudCategory;
    [cloudSmallFront setScale:0.15];
    [self addChild:cloudSmallFront];
    
    self.checkPoint = [[CheckPointNode alloc] init];
    self.checkPoint.position = CGPointMake(self.position.x, self.position.y);
    self.checkPoint.zPosition = ZPositionCheckPointCategory;
    [self addChild:self.checkPoint];
}







@end
