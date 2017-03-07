//
//  ViewController.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/6/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "ViewController.h"
#import "AutolayoutTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        [_tableView setBackgroundColor:[UIColor orangeColor]];
        [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [[self view] addSubview:_tableView];
    }
    return _tableView;
}

-(UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        [_bottomView setBackgroundColor:[UIColor greenColor]];
        [_bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self view] addSubview:_bottomView];
    }
    return _bottomView;
}

-(UIButton *)button {
    if (!_button) {
        _button = [UIButton new];
        [_button setBackgroundColor:[UIColor redColor]];
        [_button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[self bottomView] addSubview:_button];
    }
    return _button;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *views = @{
                           @"tableView" : self.tableView ,
                          @"bottomView" : self.bottomView,
                           @"button" : self.button
                        };
    
    // Horizontal layout - note the options for aligning the top and bottom of all views
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomView]|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    
    // Vertical layout - we only need one "column" of information because of the alignment options used when creating the horizontal layout
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView][bottomView(70)]|" options:0 metrics:nil views:views]];
    
    // Action Button
     [self.bottomView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[button]-20-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    
    // Vertical layout - we only need one "column" of information because of the alignment options used when creating the horizontal layout
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[button]-10-|" options:0 metrics:nil views:views]];
    
    
    // Register Cell
    [[self tableView] registerClass:[AutolayoutTableViewCell class] forCellReuseIdentifier:@"reuse"];
    self.tableView.estimatedRowHeight = 50.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (AutolayoutTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
   // cell.textLabel.text = @"Durgesh";
    return cell;
}


@end
