//
//  ChildViewController.m
//  Objective-C
//
//  Created by Durgesh Lal Gupta on 5/21/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

#import "TypeThreeTableViewCell.h"
#import "ChildViewController.h"

@interface ChildViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [[self tableView] registerClass:[TypeThreeTableViewCell class] forCellReuseIdentifier:@"reuse"];
    
    [self setHeaderType:HeaderTypePrimaryLabelOnly];
    [self setFooterType:FooterTypePrimaryButtonOnly];
    
    self.primaryLabel.text = @"I am a big primary Label. I am a big primary Label.I am a big primary Label.I am a big primary Label.";
    
    self.secondryLabel.text = @"I am a big secondry Label.I am a big secondry Label.I am a big secondry Label.I am a big secondry Label. secondrysecondrysecondrysecondrysecondrysecondrysecondrysecondry";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = (TypeThreeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    return cell;
    
}


@end
