
//  Created by HongWeicheng.
//

#import "LevelLabelNode.h"
#import "Geometry.h"

@implementation LevelLabelNode

- (instancetype)init {
    if (self = [super init]) {
        self.text = [NSString stringWithFormat:@"%d",3];
//        [self initNodeGraph];
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"摸了 levelLabelNode");
}
//- (void)initNodeGraph {
//    SKLabelNode *levelNode =
//    [self addChild:levelNode];
//}







@end
