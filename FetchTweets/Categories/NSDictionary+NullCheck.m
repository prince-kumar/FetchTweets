//
//  NSDictionary+NullCheck.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "NSDictionary+NullCheck.h"

@implementation NSDictionary (NullCheck)

- (id)validatedValueForKey:(NSString *)key {
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSNull class]]) {
        value = nil;
    }
    return value;
}

-(id)validatedValueForKeyPath:(NSString *)keyPath{
    id value = [self valueForKeyPath:keyPath];
    if ([value isKindOfClass:[NSNull class]]) {
        value = nil;
    }
    return value;
}

- (void)setValidatedValue:(id)value forKey:(NSString *)key
{
    if (!value || [value class] == [NSNull class]) {
        [self setValue:@"" forKey:key];
    }
    else
        [self setValue:value forKey:key];
}



@end
