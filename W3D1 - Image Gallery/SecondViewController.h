//
//  SecondViewController.h
//  W3D1 - Image Gallery
//
//  Created by Murat Ekrem Kolcalar on 11/14/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) UIScrollView *fullScreenScrollView;

@property (strong, nonatomic) UIImageView *fullScreenImageView;
@property (strong, nonatomic) UIImage *passedImage;

@property (strong, nonatomic) NSString *passedString;

@property (weak, nonatomic) NSLayoutConstraint *constraintLeft;
@property (weak, nonatomic) NSLayoutConstraint *constraintRight;
@property (weak, nonatomic) NSLayoutConstraint *constraintTop;
@property (weak, nonatomic) NSLayoutConstraint *constraintBottom;

@end
