//
//  CJMViewRoundCorner.h
//  CJMViewCategory
//
//  Created by chenjm on 2020/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, CJMViewMaskedCorners) {
    CJMViewMaskedCornersTopLeft = kCALayerMinXMinYCorner,     // 1U << 0,
    CJMViewMaskedCornersToRight = kCALayerMaxXMinYCorner,     // 1U << 1,
    CJMViewMaskedCornersBottomLeft = kCALayerMinXMaxYCorner,  // 1U << 2,
    CJMViewMaskedCornersBottomRight = kCALayerMaxXMaxYCorner, // 1U << 3,
    
    CJMViewMaskedCornersTop = CJMViewMaskedCornersTopLeft | CJMViewMaskedCornersToRight,
    CJMViewMaskedCornersBottom = CJMViewMaskedCornersBottomLeft | CJMViewMaskedCornersBottomLeft,
    CJMViewMaskedCornersAll = ~0UL
};

typedef NS_ENUM(NSInteger, CJMViewMaskedType) {
    CJMViewMaskedTypeSetMask = 0, // 向view.layer 设置mask，不能使用阴影，不能使用边缘色。
    CJMViewMaskedTypeAddMask,     // 向view.layer添加layer，可以使用阴影，但是背景色需求去掉，但是clipTobounds可能有问题。
};


@interface CJMViewRoundCorner : NSObject
@property (nonatomic, assign) CJMViewMaskedCorners maskedCorners;   // 哪些圆角， 默认为 CJMViewMaskedCornersAll
@property (nonatomic, strong) UIColor *maskedColor;                 // 设置mask的颜色，默认白色。ios11以下系统才需要设置。设置mask的背景色，也需要将view的背景色清除掉。
@property (nonatomic, assign) CJMViewMaskedType maskedType;         // 设置遮罩的类型。
@property (nonatomic, assign) CGFloat radius;                       // 圆角的角度，默认 0
@property (nonatomic, assign) CGFloat borderWidth;                  // 设置边缘宽度，默认 0
@property (nonatomic, strong) UIColor *borderColor;                 // 设置边缘颜色，默认 白色
@property (nonatomic, assign) CGFloat shadowRadius;                 // 阴影角度，默认0
@property (nonatomic, strong) UIColor *shadowColor;                 // 阴影颜色，默认白色
@property (nonatomic, assign) CGSize shadowOffset;                  // 阴影偏移量，默认CGSizeZero
@property (nonatomic, assign) CGFloat shadowOpacity;                // 不透明度，默认0
@end

NS_ASSUME_NONNULL_END
