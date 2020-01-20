
//  Created by HongWeicheng on 8/9/14.
//

#ifndef BallGravity_Categories_h
#define BallGravity_Categories_h

typedef NS_OPTIONS(uint32_t, ZPositionCategory) {

    EnemyCategory         =  1 << 2,
    PlayerMissileCategory =  1 << 3,
    BackCloudCategory  =  1 << 4,
    ZPositionCheckPointCategory = 1 <<7,
    ZPositionHeavenPalace = 1 << 8,
    ZPositionLongCategory =  1 << 9,
    FrontCloudCategory  =  1 << 10,
    ZPositionSelectLevelCategory = 1 << 11,
    ZPositionLevelLabelCategory = 1 << 12
    
};

#endif
