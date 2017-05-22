//
//  ViewController.h
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/6/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HeaderType) {
    HeaderTypeNone,
    HeaderTypePrimaryLabelOnly,
    HeaderTypeWithSecondryLabel,
};

typedef NS_ENUM(NSUInteger, FooterType) {
    FooterTypeNone,
    FooterTypePrimaryButtonOnly,
    FooterTypeWithSecondryButton,
};

@interface ViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *primaryLabel;
@property (nonatomic, strong) UILabel *secondryLabel;

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *primaryButton;
@property (nonatomic, strong) UIButton *secondryButton;

@property (nonatomic, assign) HeaderType headerType;
@property (nonatomic, assign) FooterType footerType;

@end

