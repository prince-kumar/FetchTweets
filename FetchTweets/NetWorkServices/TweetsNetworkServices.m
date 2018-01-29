//
//  TweetsNetworkServices.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "TweetsNetworkServices.h"

static NSString *errorMessage = @"There was an issue contacting twitter servers, please try again later.";


@implementation TweetsNetworkServices

+ (NSString*)errorMessage {
    return errorMessage;
}

+ (void)cancelRequests {
    [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        [dataTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionDataTask *dataTask = obj;
            NSLog(@"task: %@ - %@", dataTask, obj);
        }];
    }];
}


+ (NSMutableURLRequest *)createGetRequestWithBaseUrl:(NSString *)baseUrl andParamString:(NSString *)paramString
{
    
    NSString *urlString = paramString.length == 0 ?  [NSString stringWithFormat:@"%@", baseUrl] : [NSString stringWithFormat:@"%@?%@", baseUrl, paramString] ;
    
    NSLog(@"GET urlString : %@", urlString);
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    // [request setHTTPMethod:@"GET"];
    //[request setTimeoutInterval:60];
    //[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return [request mutableCopy];
}

+ (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error)
        {
            NSDictionary * dictionaryResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if(dictionaryResponse)
            {
                NSLog(@"API is: %@ \n and Response is: \n %@",[request URL],
                      [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:dictionaryResponse
                                                                                     options:NSJSONWritingPrettyPrinted
                                                                                       error:nil]
                                            encoding:NSUTF8StringEncoding]);
            }
        }
        
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse statusCode]==401) {
            NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"sessionError" object:self];
        }
        else{
            
            completionHandler(data, response, error);
        }
        
    }];
    
    return dataTask;
}


@end
