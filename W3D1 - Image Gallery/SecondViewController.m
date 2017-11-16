//
//  SecondViewController.m
//  W3D1 - Image Gallery
//
//  Created by Murat Ekrem Kolcalar on 11/14/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *fullScreenScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    fullScreenScrollView.contentSize = CGSizeMake(150,400);
    fullScreenScrollView.backgroundColor = [UIColor blackColor];
    fullScreenScrollView.delegate = self;
    fullScreenScrollView.clipsToBounds = YES;
    fullScreenScrollView.scrollEnabled = YES;
    fullScreenScrollView.minimumZoomScale = 0.5;
    fullScreenScrollView.maximumZoomScale = 5;
    fullScreenScrollView.showsVerticalScrollIndicator = YES;
    fullScreenScrollView.showsHorizontalScrollIndicator = YES;
    fullScreenScrollView.userInteractionEnabled = YES;
    [self.view addSubview:fullScreenScrollView];
    
    UIImageView *fullScreenImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    fullScreenImageView.contentMode = UIViewContentModeScaleAspectFit;
    fullScreenImageView.image = _passedImage;
    fullScreenImageView.userInteractionEnabled = NO;
    [fullScreenScrollView addSubview: fullScreenImageView];
//    this piece of shit right here gave me 200+ minutes of headache
    self.fullScreenImageView = fullScreenImageView;
    
    UILongPressGestureRecognizer *goingBackGestureRecognizer = [UILongPressGestureRecognizer new];
    [self.fullScreenImageView addGestureRecognizer:goingBackGestureRecognizer];
    [goingBackGestureRecognizer addTarget:self action:@selector(handleLongPress:)];

}

#pragma mark UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.fullScreenImageView;
}

- (void) handleLongPress: (UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self performSegueWithIdentifier:@"segueForGoingBack" sender:self];
        NSLog(@"Going back success!");
    }
}

@end
