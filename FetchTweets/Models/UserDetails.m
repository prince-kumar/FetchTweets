//
//  UserDetails.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "UserDetails.h"
#import "NSDictionary+NullCheck.h"
@implementation UserDetails

- (UserDetails *) init {
    if (self = [super init]) {
        _userArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (UserDetails *)initWithDict:(NSDictionary*)infoDictionary{
    
    
    self = [super init] ;
    
    if(self)
    {

        
        _name = [infoDictionary validatedValueForKey:@"name"];
        _profile_sidebar_fill_color =[infoDictionary validatedValueForKey:@"profile_sidebar_fill_color"];
        _profile_background_tile = [infoDictionary validatedValueForKey:@"profile_background_tile"];
        _profile_sidebar_border_color = [infoDictionary validatedValueForKey:@"profile_sidebar_border_color"];
        _profile_image_url = [infoDictionary validatedValueForKey:@"profile_image_url"];
        _follow_request_sent = [infoDictionary validatedValueForKey:@"follow_request_sent"];
        _is_translator = [infoDictionary validatedValueForKey:@"is_translator"];
    
    }
    
    return self;
    
}


@end
