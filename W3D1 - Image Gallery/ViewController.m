//
//  ViewController.m
//  W3D1 - Image Gallery
//
//  Created by Murat Ekrem Kolcalar on 11/14/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *galleryScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2.5, self.view.frame.size.width, self.view.frame.size.height/6)];
    galleryScrollView.backgroundColor = [UIColor whiteColor];
    galleryScrollView.scrollEnabled = YES;
    galleryScrollView.showsVerticalScrollIndicator = YES;
    galleryScrollView.showsHorizontalScrollIndicator = YES;
    galleryScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, galleryScrollView.frame.size.height);
    galleryScrollView.alwaysBounceHorizontal = YES;
    [self.view addSubview:galleryScrollView];
    
    UIImageView *firstImageView = [self createImageViewsWithImageAndFrame:@"samoyedxx" withFrame:CGRectMake(0, 0, 150, 150)];
    [galleryScrollView addSubview:firstImageView];
    //add each view to an array, for each view in the array add +150pts to fix the content size later
    UIImageView *secondImageView = [self createImageViewsWithImageAndFrame:@"image1" withFrame:CGRectMake(firstImageView.frame.size.width, 0, 150, 150)];
    [galleryScrollView addSubview:secondImageView];
    UIImageView *thirdImageView = [self createImageViewsWithImageAndFrame:@"ls" withFrame:CGRectMake(secondImageView.frame.size.width + firstImageView.frame.size.width, 0, 150, 150)];
    [galleryScrollView addSubview:thirdImageView];
    UIImageView *fourthImageView = [self createImageViewsWithImageAndFrame:@"pizza" withFrame:CGRectMake(firstImageView.frame.size.width + secondImageView.frame.size.width + thirdImageView.frame.size.width + 50, 0, 150, 150)];
    [galleryScrollView addSubview:fourthImageView];
}

- (UIImageView *) createImageViewsWithImageAndFrame: (NSString *)imageNamed
                                          withFrame: (CGRect)rect {
    UIImageView *newImageView = [[UIImageView alloc]initWithFrame:(CGRect)rect];
    newImageView.contentMode = UIViewContentModeScaleAspectFill;
    newImageView.image = [UIImage imageNamed:imageNamed];
    newImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *imageViewTapRecognizer = [UITapGestureRecognizer new];
    [newImageView addGestureRecognizer:imageViewTapRecognizer];
    [imageViewTapRecognizer addTarget:self action:@selector(handleImageViewTap:)];
    NSLog(@"Creating an image");
    return newImageView;
}

- (void) handleImageViewTap: (UITapGestureRecognizer*)sender {
    // Get the image from the tapped view
    UIImageView *tappedImageView = (UIImageView *)sender.view;
//    self.tappedImage = tappedImageView.image;
    // Perform the segue
    [self performSegueWithIdentifier:@"segueForFullSizeImage" sender:tappedImageView];
    NSLog(@"Image tapped.");
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImageView *)sender {
    SecondViewController *destinationVC = segue.destinationViewController;
    destinationVC.passedString = @"test";
    destinationVC.passedImage = sender.image;
    NSLog(@"Segue finished successfully.");
}

@end
