//
//  tweetsTableViewController.h
//  FetchTweets
//
//  Created by Prince Kumar on 20/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TwitterKit/TWTRKit.h>

@interface TweetsTableViewController : TWTRTimelineViewController

@end


@interface UITableViewCell (Nib)

+ (NSString*)nibName;

+ (NSString*)reuseIdentifier;

+ (id)loadFromNib;

+ (id)loadFromNib :(NSString *)nibName;

+ (id)loadFromNibName:(NSString*)nibName bundle:(NSBundle*)bundle reuseIdentifier:(NSString*)reuseIdentifier;

@end

