//
//  TweetsNetworkServices.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetsNetworkServices : NSObject

+ (NSString*)errorMessage;

+ (void)cancelRequests;

/**
 basic NSURLRequest with a base url and parameter sent as strings
 @param baseUrl url point to the server, could be changed for production or qa or where services are
 @return sends back constucted url request for a url session
 */


+ (NSMutableURLRequest *)createGetRequestWithBaseUrl:(NSString *)baseUrl andParamString:(NSString *)paramString;

+ (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;



@end
