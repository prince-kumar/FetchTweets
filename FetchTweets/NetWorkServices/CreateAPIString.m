//
//  CreateAPIString.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "CreateAPIString.h"

@implementation CreateAPIString

//https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=twitterapi&count=2

NSString *baseUrl = @"https://stream.twitter.com";



+ (NSString*) baseUrl {
    return [NSString stringWithFormat:@"%@/%@",baseUrl, @"1.1"];
}


+ (void) setBaseUrl:(NSString *)url {
    baseUrl = url;
}


+ (NSString *) returnStatusUrl {
    return [NSString stringWithFormat:@"@%@/%@", baseUrl, @"statuses/home_timeline.json"];
}

+ (NSString*) returnTrendsURL {
    return [NSString stringWithFormat:@"@%@/%@", baseUrl, @"trends/available.json"];
}
@end
