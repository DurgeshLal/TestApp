//
//  TypeThreeTableViewCell.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/7/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "TypeThreeTableViewCell.h"

@interface TypeThreeTableViewCell ()

@property (nonatomic, strong) UILabel *email;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UIImageView *icon;
@end


@implementation TypeThreeTableViewCell
- (UILabel *)email {
    if (!_email) {
        _email = [UILabel new];
        [_email setNumberOfLines:0];
        [_email setText:@"I am a header"];
        [_email setTextColor:[UIColor blackColor]];
        [_email setBackgroundColor:[UIColor redColor]];
        [_email setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_email setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_email setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self contentView] addSubview:_email];
        
    }
    return _email;
}

- (UILabel *)phone {
    if (!_phone) {
        _phone = [UILabel new];
        [_phone setNumberOfLines:0];
        [_phone setText:@"I am footer"];
        [_phone setTextColor:[UIColor blackColor]];
        [_phone setBackgroundColor:[UIColor redColor]];
        [_phone setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_phone setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_phone setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self contentView] addSubview:_phone];
    }
    return _phone;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [UIImageView new];
        [[_icon layer] setBorderWidth:1.0];
        [_icon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[_icon layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
        
        [[self contentView] addSubview:_icon];
    }
    return _icon;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSDictionary *views = @{
                                @"email" : [self email],
                                @"phone" : [self phone],
                                @"icon" : [self icon]
                                };
        
        
        
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(80)]-10-[email]-10-|" options:0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(80)]-10-[phone]-10-|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[email]-10-[phone(==email)]-20-|" options:0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[icon(80)]-10-|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [[[self icon] layer] setCornerRadius:self.icon.bounds.size.width / 2];
}






@end

