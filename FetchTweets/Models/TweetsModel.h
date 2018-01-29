//
//  TweetsModel.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TweetsModel.h"

@interface TweetsModel : NSObject

@property(nonatomic, strong) NSArray* tweetsArray;


// user details
@property (nonatomic, strong) NSString *coordinates;
@property (nonatomic, strong) NSString *truncated;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *favorited;
@property (nonatomic, strong) NSString *id_str;
@property (nonatomic, strong) NSString *in_reply_to_user_id_str;
@property (nonatomic, strong) NSString *entities; // Used for storing  image url
@property (nonatomic, strong) NSArray *urls; // response user images
@property (nonatomic, strong) NSArray *hashtags; // top hasthags

@property (nonatomic, strong) NSString *user_mentions;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *contributors;
@property (nonatomic, strong) NSString *id;
// user tweets details

@property (nonatomic, strong) NSString *default_profile;
@property (nonatomic, strong) NSString *contributors_enabled;
@property (nonatomic, strong) NSString *utc_offset;
@property (nonatomic, strong) NSString *idprofile_image_url_https;

@property (nonatomic, strong) NSString *protected;
@property (nonatomic, strong) NSString *geo_enabled;
@property (nonatomic, strong) NSString *verified;
@property (nonatomic, strong) NSString *time_zone;


@property(nonatomic, strong) TweetsModel *model;

@end
