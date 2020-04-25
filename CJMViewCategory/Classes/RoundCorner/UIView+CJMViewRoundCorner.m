//
//  UIView+CJMViewRoundCorner.m
//  CJMViewCategory
//
//  Created by chenjm on 2020/4/24.
//

#import "UIView+CJMViewRoundCorner.h"
#import <objc/runtime.h>

@implementation UIView (CJMViewRoundCorner)
@dynamic cjmv_corner;


#pragma mark - 交换函数

+ (void)load {
    if (@available(iOS 11.0, *)) {
        return;
    }
    
    NSArray *methods = @[@"layoutSubviews"];
    for (NSString *method in methods) {
        SEL originSel = NSSelectorFromString(method);
        Method originMethod = class_getInstanceMethod([self class], originSel);
        
        SEL switchSel = NSSelectorFromString([NSString stringWithFormat:@"cjmv_%@", method]);
        Method switchMethod = class_getInstanceMethod([self class], switchSel);
        
        if (class_addMethod([self class], originSel, method_getImplementation(switchMethod), method_getTypeEncoding(switchMethod))) {
            class_replaceMethod([self class], switchSel, method_getImplementation(originMethod), method_getTypeEncoding(switchMethod));
        } else {
            method_exchangeImplementations(originMethod, switchMethod);
        }
    }
}

- (void)cjmv_layoutSubviews {
    [self cjmv_layoutSubviews];
    
    if (self.cjmv_corner) {
        CAShapeLayer *maskShapeLayer = [self cjmv_maskShapeLayer];
        maskShapeLayer.path = [self cjmv_bezierPath].CGPath;
        maskShapeLayer.frame = self.bounds;
        
        CAShapeLayer *shadowShapeLayer = [self cjmv_shadowShapeLayer];
        shadowShapeLayer.path = [self cjmv_bezierPath].CGPath;
        shadowShapeLayer.frame = self.bounds;
    }
}


#pragma mark - cjmv_shadowShapeLayer

- (CAShapeLayer *)cjmv_shadowShapeLayer {
    return objc_getAssociatedObject(self, @selector(cjmv_shadowShapeLayer));
}

- (void)setCjmv_shadowShapeLayer:(CAShapeLayer *)cjmv_shadowShapeLayer {
    objc_setAssociatedObject(self, @selector(cjmv_shadowShapeLayer), cjmv_shadowShapeLayer, OBJC_ASSOCIATION_RETAIN);
}


#pragma mark - cjmv_maskShapeLayer

- (CAShapeLayer *)cjmv_maskShapeLayer {
    return objc_getAssociatedObject(self, @selector(cjmv_maskShapeLayer));
}

- (void)setCjmv_maskShapeLayer:(CAShapeLayer *)cjmv_maskShapeLayer {
    objc_setAssociatedObject(self, @selector(cjmv_maskShapeLayer), cjmv_maskShapeLayer, OBJC_ASSOCIATION_RETAIN);
}


#pragma mark - cjmv_corner

- (CJMViewRoundCorner *)cjmv_corner {
    return objc_getAssociatedObject(self, @selector(cjmv_corner));
}

- (void)setCjmv_corner:(CJMViewRoundCorner *)cjmv_corner {
    objc_setAssociatedObject(self, @selector(cjmv_corner), cjmv_corner, OBJC_ASSOCIATION_RETAIN);
    
    if (@available(iOS 11, *)) {
        self.layer.shadowRadius = cjmv_corner.shadowRadius;
        self.layer.shadowOffset = cjmv_corner.shadowOffset;
        self.layer.shadowOpacity = cjmv_corner.shadowOpacity;
        self.layer.shadowColor = cjmv_corner.shadowColor.CGColor;
        self.layer.maskedCorners = (CACornerMask)cjmv_corner.maskedCorners;
        self.layer.borderWidth = cjmv_corner.borderWidth;
        self.layer.borderColor = cjmv_corner.borderColor.CGColor;
        self.layer.cornerRadius = cjmv_corner.radius;
        
        return;
    }

    if (cjmv_corner) {
        /* 圆角 */
        CAShapeLayer *maskShapLayer = [self cjmv_maskShapeLayer];
        if (!maskShapLayer) {
            maskShapLayer = [CAShapeLayer layer];
            [self setCjmv_maskShapeLayer:maskShapLayer];
        }

        maskShapLayer.path = [self cjmv_bezierPath].CGPath;
        maskShapLayer.fillColor = cjmv_corner.maskedColor.CGColor;
        maskShapLayer.frame = self.bounds;
        
        if (cjmv_corner.maskedType == CJMViewMaskedTypeSetMask) {
            self.layer.mask = maskShapLayer;
        } else {
            [self.layer addSublayer:maskShapLayer];
            
            self.layer.backgroundColor = [UIColor clearColor].CGColor;

            
            /* 阴影 */
            CAShapeLayer *shadowShapLayer = [self cjmv_shadowShapeLayer];
            if (!shadowShapLayer) {
                shadowShapLayer = [CAShapeLayer layer];
                [self setCjmv_shadowShapeLayer:shadowShapLayer];
            }
            
            if (!shadowShapLayer.superlayer) {
                [self.layer addSublayer:shadowShapLayer];
            }
            
            shadowShapLayer.path = [self cjmv_bezierPath].CGPath;
            shadowShapLayer.frame = self.bounds;
            shadowShapLayer.fillColor = cjmv_corner.maskedColor.CGColor;
            shadowShapLayer.strokeColor = cjmv_corner.borderColor.CGColor;
            shadowShapLayer.lineWidth = cjmv_corner.borderWidth;
            
            shadowShapLayer.shadowRadius = cjmv_corner.shadowRadius;
            shadowShapLayer.shadowColor = cjmv_corner.shadowColor.CGColor;
            shadowShapLayer.shadowOffset = cjmv_corner.shadowOffset;
            shadowShapLayer.shadowOpacity = cjmv_corner.shadowOpacity;
        }
    } else {
        if ([self cjmv_maskShapeLayer] && [self cjmv_maskShapeLayer].superlayer) {
            [[self cjmv_maskShapeLayer] removeFromSuperlayer];
            [self setCjmv_maskShapeLayer:nil];
        }
        
        if ([self cjmv_shadowShapeLayer] && [self cjmv_shadowShapeLayer].superlayer) {
            [[self cjmv_shadowShapeLayer] removeFromSuperlayer];
            [self setCjmv_shadowShapeLayer:nil];
        }
    }
}

- (UIBezierPath *)cjmv_bezierPath {
    return [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                 byRoundingCorners:(UIRectCorner)self.cjmv_corner.maskedCorners
                                       cornerRadii:CGSizeMake(self.cjmv_corner.radius, self.cjmv_corner.radius)];;
}



@end
