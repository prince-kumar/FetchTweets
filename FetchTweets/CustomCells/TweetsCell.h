//
//  TweetsCell.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDetails.h"

@protocol TweetsCellDelegate <NSObject>

@end

@interface TweetsCell : UITableViewCell

@property (nonatomic, retain) UserDetails *model;

- (void) setBoldFont:(NSString*)wholestring textToSetAttribute:(NSString*)bold setToLabel:(UILabel*)label;

@property id <TweetsCellDelegate> delegate;


@end
