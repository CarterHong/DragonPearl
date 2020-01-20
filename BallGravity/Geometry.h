
//  Created by HongWeicheng.
//

#ifndef TextShooter_Geometry_h
#define TextShooter_Geometry_h


// Takes a CGVector and a CGFLoat.
// Returns a new CGFloat where each component of v has been multiplied by m.
static inline CGVector VectorMultiply(CGVector v, CGFloat m) {
    return CGVectorMake(v.dx * m, v.dy * m);
}

// Takes two CGPoints.
// Returns a CGVector representing a direction from p1 to p2.
static inline CGVector VectorBetweenPoints(CGPoint p1, CGPoint p2) {
    return CGVectorMake(p2.x - p1.x, p2.y - p1.y);
}

// Takes a CGVector.
// Returns a CGFloat containing the length of the vector, calculated using
// Pythagoras' theorem.
static inline CGFloat VectorLength(CGVector v) {
    return sqrtf(powf(v.dx, 2) + powf(v.dy, 2));
}

// Takes two CGPoints. Returns a CGFloat containing the distance between them,
// calculated with Pythagoras' theorem.
static inline CGFloat PointDistance(CGPoint p1, CGPoint p2) {
    return sqrtf(powf(p2.x - p1.x, 2) + powf(p2.y - p1.y, 2));
}

//将向量绕z轴正方向，顺时针旋转90度
static inline CGVector rotateQuart(CGVector v) {
    CGFloat x1 = v.dx;  //记录初始向量
    CGFloat y1 = v.dy;
    CGFloat x2;         //记录旋转后的向量
    CGFloat y2;
    
    
    
    if (x1>0 && y1>0) {
        x2 = - y1;
        y2 = x1;
    }
    else if (x1<0 && y1>0) {
        x2 = -y1;
        y2 = x1;
    }
    else if (x1<0 && y1<0) {
        x2 = -y1;
        y2 = x1;
    }
    else if (x1>0 && y1<0) {
        x2 = -y1;
        y2 = x1;
    }
    else if (x1>=0 && y1 == 0) {
        x2 = 0;
        y2 = x1;
    }
    else if (x1<0 && y1 == 0) {
        x2 = 0;
        y2 = x1;
    }
    else if (x1 == 0 && y1>=0 ){
        x2 = -y1;
        y2 = 0;
    }
    else {
        x2 = -y1;
        y2 = 0;
    }
    return CGVectorMake(x2, y2);
}


#endif
