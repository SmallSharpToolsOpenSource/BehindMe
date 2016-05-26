//
//  CollectionViewController.m
//  BehindMe
//
//  Created by Brennan Stehling on 5/26/16.
//  Copyright © 2016 Acme. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIImage *image = [UIImage imageNamed:@"CaptainAmerica.jpg"];
//    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:image];

//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.collectionView.bounds];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.image = image;
//    self.collectionView.backgroundView = imageView;

    UIImage *image = [UIImage imageNamed:@"CaptainAmerica.jpg"];
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.collectionView.bounds];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.collectionView.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    UIView *overlayView = [[UIView alloc] initWithFrame:self.collectionView.bounds];
    overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
    [backgroundView addSubview:imageView];
    [backgroundView addSubview:overlayView];
    self.collectionView.backgroundView = backgroundView;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

@end
