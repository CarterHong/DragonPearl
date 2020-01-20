
//  Created by HongWeicheng.
//

#import <SpriteKit/SpriteKit.h>
#import "ZPositionCategories.h"
#import "BallNode.h"

@interface ShenLongNode : SKSpriteNode

@property (nonatomic,strong) NSMutableArray *textureArray;

- (void)changeToQuickRun;
- (void)changeToSlowWalk;

@end
