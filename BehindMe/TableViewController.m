//
//  TableViewController.m
//  BehindMe
//
//  Created by Brennan Stehling on 5/26/16.
//  Copyright © 2016 Acme. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"CaptainAmerica.jpg"];
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.tableView.bounds];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.tableView.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    UIView *overlayView = [[UIView alloc] initWithFrame:self.tableView.bounds];
    overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
    [backgroundView addSubview:imageView];
    [backgroundView addSubview:overlayView];
    self.tableView.backgroundView = backgroundView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", (long)(indexPath.row + 1)];

    return cell;
}

@end
