//
//  TypeOneTableViewCell.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/7/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "TypeOneTableViewCell.h"

@interface TypeOneTableViewCell ()

@property (nonatomic, strong) UILabel *labelOne;

@end

@implementation TypeOneTableViewCell

- (UILabel *)labelOne {
    if (!_labelOne) {
        _labelOne = [UILabel new];
        [_labelOne setNumberOfLines:0];
        [_labelOne setText:@"Label One"];
        [_labelOne setTextColor:[UIColor blackColor]];
        [_labelOne setBackgroundColor:[UIColor clearColor]];
        [_labelOne setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_labelOne setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        
        [[self contentView] addSubview:_labelOne];
        
    }
    return _labelOne;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        if ([reuseIdentifier isEqualToString:@"header"]) {
            [[self labelOne] setTextColor:[UIColor grayColor]];
            [[self labelOne] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0]];
            
        } else {
            [[self labelOne] setTextColor:[UIColor grayColor]];
            [[self labelOne] setFont:[UIFont fontWithName:@"Helvetica" size:15.0]];
        }
        
        NSDictionary *views = @{
                                @"labelOne" : self.labelOne
                                };
        
        
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelOne]-10-|" options:0 metrics:nil views:views];
        [self.contentView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[labelOne]-5-|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
    }
    return self;
}


@end
