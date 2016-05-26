//
//  TableViewController.m
//  BehindMe
//
//  Created by Brennan Stehling on 5/26/16.
//  Copyright © 2016 Acme. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic) BOOL didFirstToggle;
@property (nonatomic) BOOL showBackgroundImage;

@property (readonly, nonatomic) UIImage *screenshotImage;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    if (!self.didFirstToggle) {
        self.didFirstToggle = YES;
        [self toggleBackground];
    }
}

- (void)toggleBackground {
    CGRect frame = self.tableView.frame;
    UIEdgeInsets inset = self.tableView.contentInset;
    frame.origin.y = inset.top;

    self.showBackgroundImage = !self.showBackgroundImage;

    UIView *backgroundView = nil;

    if (self.showBackgroundImage) {
        backgroundView = [[UIView alloc] initWithFrame:frame];
        UIImageView *screenshotImageView = [[UIImageView alloc] initWithFrame:frame];
        screenshotImageView.image = self.screenshotImage;
        screenshotImageView.contentMode = UIViewContentModeScaleAspectFit;
        screenshotImageView.alpha = 0.5;
        UIImageView *captainImageView = [[UIImageView alloc] initWithFrame:frame];
        captainImageView.image = [UIImage imageNamed:@"CaptainAmerica.jpg"];
        captainImageView.contentMode = UIViewContentModeScaleAspectFill;
        UIView *overlayView = [[UIView alloc] initWithFrame:frame];
        overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        [backgroundView addSubview:captainImageView];
        [backgroundView addSubview:screenshotImageView];
        [backgroundView addSubview:overlayView];
    }
    else {
        backgroundView = [[UIView alloc] initWithFrame:frame];
        backgroundView.backgroundColor = [UIColor blackColor];
    }

    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundView = backgroundView;
    [self.tableView reloadData];
}

- (IBAction)toggleButtonTapped:(id)sender {
    [self toggleBackground];
}

- (UIImage *)screenshotImage {
    return [self imageWithView:self.tableView afterScreenUpdate:YES];
}

- (UIImage *)imageWithView:(UIView *)view afterScreenUpdate:(BOOL)afterScreenUpdate {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:afterScreenUpdate];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.showBackgroundImage ? 5: 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", (long)(indexPath.row + 1)];

    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    selectedBackgroundView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.25];
    cell.selectedBackgroundView = selectedBackgroundView;

    return cell;
}

@end
