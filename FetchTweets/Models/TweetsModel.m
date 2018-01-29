//
//  TweetsModel.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "TweetsModel.h"
#import "NSDictionary+NullCheck.h"


@implementation TweetsModel

- (TweetsModel *) init {
    if (self = [super init]) {
        _tweetsArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (TweetsModel *)initWithDict:(NSDictionary*)infoDictionary{
    
    
    self = [super init] ;
    
    if(self)
    {
       
        _coordinates = [infoDictionary validatedValueForKey:@"coordinates"];
        _truncated =[infoDictionary validatedValueForKey:@"truncated"];
        _created_at = [infoDictionary validatedValueForKey:@"created_at"];
        _favorited = [infoDictionary validatedValueForKey:@"favorited"];
        _id_str = [infoDictionary validatedValueForKey:@"id_str"];
        _in_reply_to_user_id_str = [infoDictionary validatedValueForKey:@"in_reply_to_user_id_str"];
        _entities = [infoDictionary validatedValueForKey:@"entities"];
        _urls = [infoDictionary validatedValueForKey:@"urls"];
        _hashtags = [infoDictionary validatedValueForKey:@"hashtags"];
        _user_mentions = [infoDictionary validatedValueForKey:@"user_mentions"];
        _text = [infoDictionary validatedValueForKey:@"text"];
        _contributors = [infoDictionary validatedValueForKey:@"contributors"];
        _id = [infoDictionary validatedValueForKey:@"id"];
        _default_profile = [infoDictionary validatedValueForKey:@"default_profile"];
        _contributors_enabled = [infoDictionary validatedValueForKey:@"contributors_enabled"];
        _utc_offset = [infoDictionary validatedValueForKey:@"utc_offset"];
        _geo_enabled = [infoDictionary validatedValueForKey:@"geo_enabled"];
        _time_zone = [infoDictionary validatedValueForKey:@"time_zone"];
        
    }
    
    return self;
    
}

@end
