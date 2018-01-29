//
//  UserDetails.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "TweetsModel.h"

@interface UserDetails : TweetsModel

@property(nonatomic, strong) NSArray * userArray;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profile_sidebar_fill_color;
@property (nonatomic, strong) NSString *profile_background_tile;
@property (nonatomic, strong) NSString *profile_sidebar_border_color;
@property (nonatomic, strong) NSString *profile_image_url;
@property (nonatomic, strong) NSString *follow_request_sent; // Used for storing  image url
@property (nonatomic, strong) NSArray *is_translator; // top hasthags

@end
