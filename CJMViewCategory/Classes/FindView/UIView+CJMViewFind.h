//
//  UIView+CJMViewFind.h
//  CJMViewCategory
//
//  Created by chenjm on 2020/4/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CJMViewFind)

- (UITableView *)findTableView;

- (UITableViewCell *)findTableViewCellFromSubview:(UIView *)subview;

- (UICollectionView *)findCollectionViewFromSubview:(UIView *)subview;

- (UICollectionViewCell *)findCollectionViewCellFromSubview:(UIView *)subview;

- (UIView *)tryToFindSuperviewWithClass:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
