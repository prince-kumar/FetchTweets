//
//  TweetsCell.m
//  FetchTweets
//
//  Created by Prince Kumar on 29/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "TweetsCell.h"



@interface TweetsCell (/*private*/) {
    
    
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *timeStampLabel;
    __weak IBOutlet UILabel *tweetsLabel;
    __weak IBOutlet UIImageView *userImageView;
    
    
}

@end


@implementation TweetsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    userImageView.layer.borderColor = [UIColor colorWithRed:231/255.0
                                                     green:231/255.0
                                                      blue:231/255.0
                                                     alpha:0.75].CGColor;
    userImageView.layer.borderWidth = 1.0;
    userImageView.clipsToBounds = YES;
    self.accessoryView.backgroundColor = [UIColor grayColor];
}

- (void) setModel:(UserDetails *)model {
    
    _model = model;
    
    [self setBoldFont:[NSString stringWithFormat:@"%@" ,_model.name] textToSetAttribute:_model.name setToLabel:nameLabel];
    [self setBoldFont:[NSString stringWithFormat:@"%@" ,_model.text] textToSetAttribute:_model.text setToLabel:tweetsLabel];
    [self setBoldFont:[NSString stringWithFormat:@"%@" ,_model.time_zone] textToSetAttribute:_model.time_zone setToLabel:timeStampLabel];
    
    NSURL *imageURL = [NSURL URLWithString:model.profile_image_url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    [userImageView setImage:image];
}

- (void) setBoldFont:(NSString*)wholestring textToSetAttribute:(NSString*)bold setToLabel:(UILabel*)label{
    
    NSDictionary *attrDict = @{
                               NSFontAttributeName : [UIFont boldSystemFontOfSize:15],
                               NSForegroundColorAttributeName : [UIColor orangeColor]
                               };
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:wholestring];
    NSString *boldString = bold;
    NSRange boldRange = [wholestring rangeOfString:boldString];
    [attributedString addAttributes:attrDict range:boldRange];
    [label setAttributedText: attributedString];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
