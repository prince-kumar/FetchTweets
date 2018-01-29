//
//  CreateAPIString.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateAPIString : NSObject

+ (NSString*)baseUrl;
+ (void)setBaseUrl:(NSString *)url;
+ (NSString *) returnStatusUrl ;
+ (NSString*) returnTrendsURL;
@end
