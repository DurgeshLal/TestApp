//
//  TypeTwoTableViewCell.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/7/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "TypeTwoTableViewCell.h"

@interface TypeTwoTableViewCell ()

@property (nonatomic, strong) UILabel *header;
@property (nonatomic, strong) UILabel *footer;
@property (nonatomic, strong) UITextField *textField;
@end

@implementation TypeTwoTableViewCell

- (UILabel *)header {
    if (!_header) {
        _header = [UILabel new];
        [_header setNumberOfLines:0];
        [_header setText:@"I am a header"];
        [_header setTextColor:[UIColor blackColor]];
        [_header setBackgroundColor:[UIColor redColor]];
        [_header setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_header setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_header setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self contentView] addSubview:_header];
        
    }
    return _header;
}

- (UILabel *)footer {
    if (!_footer) {
        _footer = [UILabel new];
        [_footer setNumberOfLines:0];
        [_footer setText:@"I am footer"];
        [_footer setTextColor:[UIColor blackColor]];
        [_footer setBackgroundColor:[UIColor redColor]];
        [_footer setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_footer setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [_footer setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        
        [[self contentView] addSubview:_footer];
    }
    return _footer;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        [[_textField layer] setBorderWidth:1.0];
        [_textField setPlaceholder:@"Text Field"];
        [_textField setBorderStyle:UITextBorderStyleRoundedRect];
        [_textField setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_textField setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
        [[_textField layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [[self contentView] addSubview:_textField];
    }
    return _textField;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSDictionary *views = @{
                                @"header" : [self header],
                                @"footer" : [self footer],
                                @"textField" : [self textField]
                                };
        
        
        
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[header]|" options:0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[footer]|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[textField]-10-|" options:0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[header]-10-[textField(40)]-10-[footer]-10-|" options: 0 metrics:nil views:views];
        [[self contentView] addConstraints:constraints];
        
        
    }
    return self;
}

@end
