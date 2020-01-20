
//  Created by HongWeicheng.
//

#import "ShenLongNode.h"
#import "Geometry.h"
//#import "PhysicsCategories.h"

@implementation ShenLongNode
- (instancetype)init {
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"ShenLongFather %p", self];
        self.zPosition = ZPositionLongCategory;
        [self initNodeGraph];
        
    }
    return self;
}

- (void)initNodeGraph {
    SKTexture *shenLongTexture = [SKTexture textureWithImageNamed:@"long0"];
    SKSpriteNode *shenLong = [SKSpriteNode spriteNodeWithTexture:shenLongTexture];
    shenLong.name = [NSString stringWithFormat:@"ShenLong"];
    [shenLong setScale:0.8];
    
    self.textureArray = [NSMutableArray new];
    for (int i=0; i<=18; i++) {
        NSString *iString = [NSString stringWithFormat:@"%d",i];
        NSString *longTextureImageNameString = [NSString stringWithFormat:@"long%@",iString];
        SKTexture *longTexture = [SKTexture textureWithImageNamed:longTextureImageNameString];
        [self.textureArray addObject:longTexture];
    }
    SKAction *groupSlowWalk = [self slowWalk];
    [shenLong runAction:groupSlowWalk withKey:@"龙慢走"];
    [self addChild:shenLong];
}
//龙慢走
- (SKAction *)slowWalk {
    SKAction *animate = [SKAction animateWithTextures:self.textureArray timePerFrame:0.03];
    SKAction *animateReversed = [animate reversedAction];
    SKAction *sequence = [SKAction sequence:@[animate,animateReversed]];
    SKAction *repeatAnimation = [SKAction repeatActionForever:sequence];
    
    SKAction *rotate = [SKAction rotateByAngle:2*M_PI duration:3];
    SKAction *repeatRotate = [SKAction repeatActionForever:rotate];
    
    SKAction *group = [SKAction group:@[repeatAnimation,repeatRotate]];
    
    [group reversedAction];
    
    group.timingMode = SKActionTimingEaseInEaseOut;
    
    return group;
}
//龙快跑
- (SKAction *)quickRun {
    SKAction *animate = [SKAction animateWithTextures:self.textureArray timePerFrame:0.01];
    SKAction *animateReversed = [animate reversedAction];
    SKAction *sequence = [SKAction sequence:@[animate,animateReversed]];
    SKAction *repeatAnimation = [SKAction repeatActionForever:sequence];
    
    SKAction *rotate = [SKAction rotateByAngle:2*M_PI duration:3];
    SKAction *repeatRotate = [SKAction repeatActionForever:rotate];
    
    SKAction *group = [SKAction group:@[repeatAnimation,repeatRotate]];
    
    [group reversedAction];
    
    group.timingMode = SKActionTimingEaseInEaseOut;
    
    return group;
}
//龙从慢走切换到快跑
- (void)changeToQuickRun {
    
    SKAction *groupQuickRun = [self quickRun];
    [[self childNodeWithName:@"ShenLong"] removeAllActions];
    [[self childNodeWithName:@"ShenLong"] runAction:groupQuickRun withKey:@"龙快跑"];
    
}
//龙从快跑切换到慢走
- (void)changeToSlowWalk {
    
    SKAction *groupSlowWalk = [self slowWalk];
    [[self childNodeWithName:@"ShenLong"] removeAllActions];
    [[self childNodeWithName:@"ShenLong"] runAction:groupSlowWalk withKey:@"龙慢走"];
    
}

@end
