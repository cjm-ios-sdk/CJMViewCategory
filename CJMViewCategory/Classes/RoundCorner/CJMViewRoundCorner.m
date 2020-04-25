//
//  CJMViewRoundCorner.m
//  CJMViewCategory
//
//  Created by chenjm on 2020/4/24.
//

#import "CJMViewRoundCorner.h"

@implementation CJMViewRoundCorner

- (instancetype)init {
    self = [super init];
    if (self) {
        _maskedColor = [UIColor whiteColor];
        _maskedCorners = CJMViewMaskedCornersAll;
        _maskedType = CJMViewMaskedTypeSetMask;
        _radius = 0;
        _borderWidth = 0;
        _borderColor = [UIColor whiteColor];
        _shadowRadius = 0;
        _shadowColor = [UIColor whiteColor];
        _shadowOffset = CGSizeZero;
        _shadowOpacity = 0;
    }
    return self;
}

@end
