
//  Created by HongWeicheng.
//

#import <SpriteKit/SpriteKit.h>
#import "ShenLongNode.h"
#import "CloudNode.h"
#import "CheckPointNode.h"

@interface PalaceNode : SKNode

@property (strong, nonatomic) ShenLongNode *shenLongFather;
@property (strong, nonatomic) CheckPointNode *checkPoint;


@end
