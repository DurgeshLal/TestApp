//
//  ViewController.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/6/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "UITableView+HeaderView.h"
#import "ViewController.h"
#import "TypeOneTableViewCell.h"
#import "AutolayoutTableViewCell.h"
#import "TypeTwoTableViewCell.h"
#import "TypeThreeTableViewCell.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *staticView;


@end

@implementation ViewController


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        [_tableView setBackgroundColor:[UIColor orangeColor]];
        [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self view] addSubview:_tableView];
    }
    return _tableView;
}


-(UIView *)headerView {
    if (!_headerView) {
        _headerView = [UIView new];
        [_headerView setBackgroundColor:[UIColor greenColor]];
        [_headerView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self tableView] setTableHeaderView:_headerView];
    }
    return _headerView;
}

- (UILabel *)primaryLabel {
    if (!_primaryLabel) {
        _primaryLabel = [UILabel new];
        [_primaryLabel setNumberOfLines:0];
        [_primaryLabel setText:@"I am a header"];
        [_primaryLabel setTextColor:[UIColor blackColor]];
        [_primaryLabel setBackgroundColor:[UIColor redColor]];
        [_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_primaryLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_primaryLabel setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self headerView] addSubview:_primaryLabel];
        
    }
    return _primaryLabel;
}

- (UILabel *)secondryLabel {
    if (!_secondryLabel) {
        _secondryLabel = [UILabel new];
        [_secondryLabel setNumberOfLines:0];
        [_secondryLabel setText:@"I am footer"];
        [_secondryLabel setTextColor:[UIColor blackColor]];
        [_secondryLabel setBackgroundColor:[UIColor redColor]];
        [_secondryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_secondryLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_secondryLabel setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self headerView] addSubview:_secondryLabel];
    }
    return _secondryLabel;
}


-(UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        [_bottomView setBackgroundColor:[UIColor greenColor]];
        [_bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self tableView] addSubview:_bottomView];
    }
    return _bottomView;
}

-(UIButton *)primaryButton {
    if (!_primaryButton) {
        _primaryButton = [UIButton new];
        [_primaryButton setBackgroundColor:[UIColor redColor]];
        [_primaryButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self bottomView] addSubview:_primaryButton];
    }
    return _primaryButton;
}

-(UIButton *)secondryButton {
    if (!_secondryButton) {
        _secondryButton = [UIButton new];
        [_secondryButton setBackgroundColor:[UIColor redColor]];
        [_secondryButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self bottomView] addSubview:_secondryButton];
    }
    return _secondryButton;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *views = @{
                           @"tableView" : self.tableView ,
                           @"bottomView" : self.bottomView,
                           @"button" : self.primaryButton
                        };
    
    // Horizontal layout - note the options for aligning the top and bottom of all views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    
    // Vertical layout - we only need one "column" of information because of the alignment options used when creating the horizontal layout
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views]];
    
    // Register Cell
    self.tableView.estimatedRowHeight = 50.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}



- (void)setHeaderType:(HeaderType)headerType
{
    _headerType = headerType;
    
    NSDictionary *views = @{
                            @"headerView" : self.headerView ,
                            @"primaryLabel" : self.primaryLabel,
                            @"secondryLabel" : self.secondryLabel
                            };

    
    switch (headerType) {
        case HeaderTypeNone:
            [self.headerView removeFromSuperview];
            break;
        case HeaderTypePrimaryLabelOnly:
        {
            [[self secondryLabel] removeFromSuperview];
            [self.tableView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headerView]-0-|" options:0 metrics:nil views:views]];
            
            [self.headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[primaryLabel]-20-|" options:0 metrics:nil views:views]];
            
            [self.headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[primaryLabel]-10-|" options:0 metrics:nil views:views]];
            break;
        }

        case HeaderTypeWithSecondryLabel:
        {
            [self.tableView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headerView]-0-|" options:0 metrics:nil views:views]];
            
            [self.headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[primaryLabel]-20-|" options:0 metrics:nil views:views]];
            
            [self.headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[secondryLabel]-20-|" options:0 metrics:nil views:views]];
            
            [self.headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[primaryLabel]-8-[secondryLabel]-10-|" options:0 metrics:nil views:views]];
            break;
        }
    }
}


- (void)setFooterType:(FooterType)footerType
{
    _footerType = footerType;
    
    NSDictionary *views = @{
                            @"bootomView" : self.bottomView ,
                            @"primaryButton" : self.primaryButton,
                            @"secondryButton" : self.secondryButton
                            };
    
    switch (footerType) {
        case FooterTypeNone:
            [self.bottomView removeFromSuperview];
            break;
        case FooterTypePrimaryButtonOnly:
        {
            [[self secondryButton] removeFromSuperview];
            [self.tableView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bootomView]-0-|" options:0 metrics:nil views:views]];
            
            [self.bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[primaryButton]-20-|" options:0 metrics:nil views:views]];
            
            [self.bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[primaryButton(40)]-10-|" options:0 metrics:nil views:views]];
            break;
        }
            
        case FooterTypeWithSecondryButton:
        {
            [self.tableView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bootomView]-0-|" options:0 metrics:nil views:views]];
            
            [self.bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[primaryButton]-20-|" options:0 metrics:nil views:views]];
            
            [self.bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[secondryButton]-20-|" options:0 metrics:nil views:views]];
            
            [self.bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[primaryButton(40)]-8-[secondryButton(40)]-10-|" options:0 metrics:nil views:views]];
            break;
        }
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.tableView.tableHeaderView = self.headerView;
    self.headerView.translatesAutoresizingMaskIntoConstraints = YES;
    [self.tableView sizeHeaderToFit];
    
    self.bottomView.translatesAutoresizingMaskIntoConstraints = YES;
    CGFloat height = self.bottomView.bounds.size.height + 70;
    if (self.tableView.contentSize.height > self.tableView.bounds.size.height - height) {
        self.tableView.tableFooterView = self.bottomView;
    } else {
        [self.tableView addSubview:self.bottomView];
         [self.bottomView setFrame:CGRectMake(self.bottomView.frame.origin.x, self.tableView.bounds.size.height - height, self.view.bounds.size.width, self.bottomView.bounds.size.height)];
    }
}



@end
