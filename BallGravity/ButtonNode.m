//  Created by HongWeicheng.
//

#import "ButtonNode.h"
#import "Geometry.h"

@implementation ButtonNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"Button %p", self];
        self.userInteractionEnabled = YES;
        [self initNodeGraph];
//        [self initPhysicsBody];
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *buttonTexture = [SKTexture textureWithImageNamed:@"button"];
    SKSpriteNode *button = [SKSpriteNode spriteNodeWithTexture:buttonTexture];
    [self addChild:button];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"摸了 button");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"popOrDismissSelectLevelNodeNotification" object:self];
}

@end
