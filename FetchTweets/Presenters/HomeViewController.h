//
//  HomeViewController.h
//  FetchTweets
//
//  Created by Prince Kumar on 20/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UITabBarController

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginButtonAction:(id)sender;


@end
