# CJMViewCategory

[![CI Status](https://img.shields.io/travis/chenjm/CJMViewCategory.svg?style=flat)](https://travis-ci.org/chenjm/CJMViewCategory)
[![Version](https://img.shields.io/cocoapods/v/CJMViewCategory.svg?style=flat)](https://cocoapods.org/pods/CJMViewCategory)
[![License](https://img.shields.io/cocoapods/l/CJMViewCategory.svg?style=flat)](https://cocoapods.org/pods/CJMViewCategory)
[![Platform](https://img.shields.io/cocoapods/p/CJMViewCategory.svg?style=flat)](https://cocoapods.org/pods/CJMViewCategory)

视图的接口扩展，包括UIButton的点击动画，UIView的圆角设置，查找父视图等。

- UIButton (CJMViewAnimated)：通过touch事件处理button的动画效果，不需要设置UIButton的事件。
- UIView (CJMViewRoundCorner)：设置view的圆角，可以单独设置4个角的其中一项或几项。兼容iOS11以下的情况。
- UIView (CJMViewFind)：通过子视图和父视图的类型找到父视图的实例。一般用于UITableViewCell的子视图反查UITableView实例的情况。

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

- UIButton (CJMViewAnimated)

``` objc
UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 60, 40)];
[self.view addSubview:button];
UIImage *image = [UIImage imageNamed:@"left.jpeg"];
[button setImage:image forState:UIControlStateNormal];
button.cjmv_animated = [CJMViewAnimated new];
button.adjustsImageWhenHighlighted = NO;
```

- UIView (CJMViewRoundCorner)

```objc
CJMViewRoundCorner *corner = [[CJMViewRoundCorner alloc] init];
corner.maskedCorners = CJMViewMaskedCornersTop;
corner.maskedColor = [UIColor redColor];
corner.shadowRadius = 4;
corner.shadowOpacity = 1.0;
corner.shadowColor = [UIColor blueColor];
corner.shadowOffset = CGSizeMake(4, 4);
corner.borderWidth = 1.0;
corner.borderColor = [UIColor blackColor];
corner.radius = 20;

UIView *redView = [[UIView alloc] init];
redView.backgroundColor = [UIColor redColor];
[self.view addSubview:redView];
redView.cjmv_corner = corner;
redView.translatesAutoresizingMaskIntoConstraints = NO;

[NSLayoutConstraint activateConstraints:@[
    [redView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
    [redView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
    [redView.widthAnchor constraintEqualToConstant:100],
    [redView.heightAnchor constraintEqualToConstant:100],
]];
```

- UIView (CJMViewFind)

```objc
UITableView *tableView = [self findTableView];
```


## Requirements

## Installation

CJMViewCategory is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CJMViewCategory'
```

## Author

chenjm, cjiemin@163.com

## License

CJMViewCategory is available under the MIT license. See the LICENSE file for more info.
