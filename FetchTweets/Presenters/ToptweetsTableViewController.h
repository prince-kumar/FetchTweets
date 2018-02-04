//
//  ToptweetsTableViewController.h
//  FetchTweets
//
//  Created by Prince Kumar on 20/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HashTagTCell.h"
#import <TwitterKit/TWTRKit.h>



@interface ToptweetsTableViewController : TWTRTimelineViewController

@property(nonatomic,strong) NSString *hashtag;


@end
