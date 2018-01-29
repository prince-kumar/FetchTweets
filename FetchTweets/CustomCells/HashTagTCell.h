//
//  HashTagTCell.h
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetsModel.h"

@protocol HashTagTCellDelegate <NSObject>

@end

@interface HashTagTCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *hashtagCell;


@property (nonatomic, retain) TweetsModel *model;


@property id <HashTagTCellDelegate> delegate;


@end
