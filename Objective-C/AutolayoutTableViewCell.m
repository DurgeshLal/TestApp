//
//  AutolayoutTableViewCell.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 3/6/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "AutolayoutTableViewCell.h"

@implementation AutolayoutTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *nameLabel = [[UILabel alloc] init];
        [nameLabel setTextColor:[UIColor blackColor]];
        [nameLabel setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        [nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        nameLabel.text = @"I am a title";
        [self.contentView addSubview:nameLabel];
        
        UILabel *mainLabel = [[UILabel alloc] init];
        [mainLabel setTextColor:[UIColor blackColor]];
        [mainLabel setBackgroundColor:[UIColor colorWithHue:66 saturation:100 brightness:63 alpha:1]];
        [mainLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [mainLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        mainLabel.text = @"I am a description";
        [self.contentView addSubview:mainLabel];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(nameLabel, mainLabel);
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[nameLabel]|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views];
        [self.contentView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[mainLabel]|"
                                                              options: 0
                                                              metrics:nil
                                                                views:views];
        [self.contentView addConstraints:constraints];
        
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[nameLabel]-10-[mainLabel(==nameLabel)]-10-|"
                                                              options: 0
                                                              metrics:nil
                                                                views:views];
        [self.contentView addConstraints:constraints];

    }
    return self;
}

@end
