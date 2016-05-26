//
//  CollectionViewController.m
//  BehindMe
//
//  Created by Brennan Stehling on 5/26/16.
//  Copyright © 2016 Acme. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property (nonatomic) BOOL didFirstToggle;
@property (nonatomic) BOOL showBackgroundImage;

@property (readonly, nonatomic) UIImage *screenshotImage;

@end

@implementation CollectionViewController

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
    CGRect frame = self.collectionView.frame;
    UIEdgeInsets inset = self.collectionView.contentInset;
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

    self.collectionView.backgroundColor = [UIColor blackColor];
    self.collectionView.backgroundView = backgroundView;
    [self.collectionView reloadData];
}

- (UIImage *)screenshotImage {
    return [self imageWithView:self.collectionView afterScreenUpdate:YES];
}

- (UIImage *)imageWithView:(UIView *)view afterScreenUpdate:(BOOL)afterScreenUpdate {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:afterScreenUpdate];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (IBAction)toggleButtonTapped:(id)sender {
    [self toggleBackground];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.showBackgroundImage ? 10: 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BasicCell" forIndexPath:indexPath];

    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%ld", (long)(indexPath.row + 1)];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

@end
