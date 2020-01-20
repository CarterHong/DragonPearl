
//  Created by HongWeicheng.
//

#import "LevelNode.h"
#import "Geometry.h"

@implementation LevelNode

- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"levelNode %p", self];
        self.userInteractionEnabled = YES;
        [self initNodeGraph];
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"摸了 levelNode");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"popOrDismissSelectLevelNodeNotification" object:self];
}

- (void)initNodeGraph {
    //    SKTexture *levelNodeTexture = [SKTexture textureWithImageNamed:@"没过的关"];
    //    SKSpriteNode *levelNode = [SKSpriteNode spriteNodeWithTexture:levelNodeTexture];
    //    [self addChild:levelNode];
}







@end
