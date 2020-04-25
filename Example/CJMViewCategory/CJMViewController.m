//
//  CJMViewController.m
//  CJMViewCategory
//
//  Created by chenjm on 04/24/2020.
//  Copyright (c) 2020 chenjm. All rights reserved.
//

#import "CJMViewController.h"
#import <CJMViewCategory.h>

@interface CJMViewController ()

@end

@implementation CJMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // view 圆角
    {
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
    }
    
    // button 动画
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 60, 40)];
        [self.view addSubview:button];
        UIImage *image = [UIImage imageNamed:@"left.jpeg"];
        [button setImage:image forState:UIControlStateNormal];
        button.cjmv_animated = [CJMViewAnimated new];
        button.adjustsImageWhenHighlighted = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
