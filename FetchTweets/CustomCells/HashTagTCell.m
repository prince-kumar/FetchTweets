//
//  HashTagTCell.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "HashTagTCell.h"


@interface HashTagTCell (/*private*/) {
    
    
    __weak IBOutlet UILabel *hasTagLabel;
    
    
    
}

@end

@implementation HashTagTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
