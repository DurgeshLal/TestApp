//
//  AutolayoutTableViewCell.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/6/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "AutolayoutTableViewCell.h"

@interface AutolayoutTableViewCell ()

@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) UIImageView *disclosure;

@property (nonatomic, strong) UILabel *labelOne;
@property (nonatomic, strong) UILabel *labelTwo;
@property (nonatomic, strong) UILabel *labelThree;
@property (nonatomic, strong) UILabel *labelFour;

@end



@implementation AutolayoutTableViewCell

- (UIView *)superView {
    if (!_superView) {
        _superView = [UIView new];
        [_superView setBackgroundColor:[UIColor lightGrayColor]];
        [_superView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [[self contentView] addSubview:_superView];
    }
    return _superView;
}

- (UIImageView *)disclosure {
    if (!_disclosure) {
        _disclosure = [UIImageView new];
        [_disclosure setBackgroundColor:[UIColor greenColor]];
        [_disclosure setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [[self contentView] addSubview:_disclosure];
        
    }
    return _disclosure;
}

- (UILabel *)labelOne {
    if (!_labelOne) {
        _labelOne = [UILabel new];
        [_labelOne setNumberOfLines:0];
        [_labelOne setText:@"Label One"];
        [_labelOne setTextColor:[UIColor blackColor]];
        [_labelOne setBackgroundColor:[UIColor redColor]];
        [_labelOne setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_labelOne setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_labelOne setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self superView] addSubview:_labelOne];
       
    }
    return _labelOne;
}

- (UILabel *)labelTwo {
    if (!_labelTwo) {
        _labelTwo = [UILabel new];
        [_labelTwo setNumberOfLines:0];
        [_labelTwo setText:@"Label Two"];
        [_labelTwo setTextColor:[UIColor blackColor]];
        [_labelTwo setBackgroundColor:[UIColor redColor]];
        [_labelTwo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_labelTwo setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_labelTwo setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self superView] addSubview:_labelTwo];
    }
    return _labelTwo;
}

- (UILabel *)labelThree {
    if (!_labelThree) {
        _labelThree = [UILabel new];
        [_labelThree setNumberOfLines:0];
        [_labelThree setText:@"Label Three"];
        [_labelThree setTextColor:[UIColor blackColor]];
        [_labelThree setBackgroundColor:[UIColor redColor]];
        [_labelThree setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_labelThree setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_labelThree setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self superView] addSubview:_labelThree];
        
    }
    return _labelThree;
}


- (UILabel *)labelFour {
    if (!_labelFour) {
        _labelFour = [UILabel new];
        [_labelFour setNumberOfLines:0];
        [_labelFour setText:@"Label Four Label Four Label Four Label Four Label Four Label Four Label Four Label Four Label Four "];
        [_labelFour setTextColor:[UIColor blackColor]];
        [_labelFour setBackgroundColor:[UIColor redColor]];
        [_labelFour setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_labelFour setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_labelFour setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
         [[self superView] addSubview:_labelFour];
    }
    return _labelFour;
}





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSDictionary *views = @{
                                @"superView" : [self superView] ,
                                @"disclosure" : [self disclosure],
                                @"labelOne" : [self labelOne],
                                @"labelTwo" : [self labelTwo],
                                @"labelThree" : [self labelThree],
                                @"labelFour" : [self labelFour]
                                };
        
        
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[superView][disclosure(30)]-10-|" options:0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[superView]|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[disclosure]|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelOne]|" options:0 metrics:nil views:views];
        [[self superView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelTwo]|" options: 0 metrics:nil views:views];
        [[self superView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelThree]|" options:0 metrics:nil views:views];
        [[self superView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelFour]|" options: 0 metrics:nil views:views];
        [[self superView] addConstraints:constraints];
        
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[labelOne]-10-[labelTwo]-10-[labelThree]-10-[labelFour]-10-|" options: 0 metrics:nil views:views];
        [[self superView] addConstraints:constraints];

    }
    return self;
}

@end
