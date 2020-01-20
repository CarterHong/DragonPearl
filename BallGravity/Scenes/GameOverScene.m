//  Created by HongWeicheng.
//

#import "GameOverScene.h"
#import "StartScene.h"

@implementation GameOverScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        
        DenLongNode *denglong = [[DenLongNode alloc] init];
        
        if (IPhoneX) {
            denglong.position = CGPointMake(self.frame.size.width * 0.75,
                                            self.frame.size.height * 0.5);
        }
        else if (iPhoneXr) {
            denglong.position = CGPointMake(self.frame.size.width * 0.8,
                                            self.frame.size.height * 0.5);
        }
        else if (iPhoneXsMax) {
            denglong.position = CGPointMake(self.frame.size.width * 0.8,
                                            self.frame.size.height * 0.5);
        }
        else {
            denglong.position = CGPointMake(self.frame.size.width * 0.73,
                                            self.frame.size.height * 0.5);
        }
        
        denglong.zPosition = 1;
        if (IPAD_7dian9_9dian7_inch||IPAD_10dian5_inch||IPAD_12dian9_inch||IPAD_11dian0_inch) {
            [denglong setScale:0.27];
        }
        else {
            [denglong setScale:0.15];
        }
        [self addChild:denglong];
        
        //mission completed
        
        SKLabelNode *topLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        topLabel.text = @"Mission Completed";
        topLabel.fontColor = [SKColor blackColor];
        topLabel.fontSize = 42;
        if (IPHONE5) {
            topLabel.position = CGPointMake(self.frame.size.width * 0.4,
                                            self.frame.size.height * 0.618);
        }
        else {
            topLabel.position = CGPointMake(self.frame.size.width * 0.35,
                                            self.frame.size.height * 0.618);
        }
        
        topLabel.zPosition = 2;
        [self addChild:topLabel];
        
        SKLabelNode *bottomLabel = [SKLabelNode labelNodeWithFontNamed:
                                    @"ChalkboardSE-Bold"];
        bottomLabel.text = @"Produced by 洪尉程";
        bottomLabel.fontColor = [SKColor blackColor];
        bottomLabel.fontSize = 32;
        
        if (IPHONE5) {
            bottomLabel.position = CGPointMake(self.frame.size.width * 0.4,
                                               self.frame.size.height * 0.3);
        }
        else {
            bottomLabel.position = CGPointMake(self.frame.size.width * 0.35,
                                               self.frame.size.height * 0.3);
        }
        
        bottomLabel.zPosition = 2;
        [self addChild:bottomLabel];
        
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       SKTransition *transition = [SKTransition flipVerticalWithDuration:1.0];
                       SKScene *start = [[StartScene alloc] initWithSize:self.frame.size];
                       [self.view presentScene:start transition:transition];
                   });
}

@end


