//
//  NSDictionary+NullCheck.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullCheck)
- (id)validatedValueForKey:(NSString *)key;
- (id)validatedValueForKeyPath:(NSString *)keyPath;
- (void)setValidatedValue:(id)value forKey:(NSString *)key;


@end
