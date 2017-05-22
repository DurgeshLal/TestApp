//
//  UITableView+HeaderView.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 5/21/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "UITableView+HeaderView.h"

@implementation UITableView (HeaderView)

- (void) sizeHeaderToFit {
    UIView *headerView = self.tableHeaderView;
    
    [headerView setNeedsLayout];
    [headerView layoutIfNeeded];
    CGFloat height = [headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    headerView.frame = ({
        CGRect headerFrame = headerView.frame;
        headerFrame.size.height = height;
        headerFrame;
    });
    
    self.tableHeaderView = headerView;
}



@end
