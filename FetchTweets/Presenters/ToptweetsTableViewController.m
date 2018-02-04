//
//  ToptweetsTableViewController.m
//  FetchTweets
//
//  Created by Prince Kumar on 20/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "ToptweetsTableViewController.h"
#import "UserDetails.h"
#import "TweetsCell.h"
#import "TweetsNetworkServices.h"
#import "HashTagTCell.h"
#import "CreateAPIString.h"
#import "TweetsTableViewController.h"
#import <TwitterKit/TWTRKit.h>


@interface ToptweetsTableViewController ()

@property(nonatomic, strong) UILabel *hashtgasLabel;
@property(nonatomic, strong) NSArray *hashtagsArray;
@property(nonatomic, strong) NSURLSessionDataTask *sessionData;

@end

@implementation ToptweetsTableViewController

static NSString * const reuseIdentifier = @"HashTagTCell";



- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"JIO";

     [self fetchHashTags];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)fetchHashTags {
    
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];

    self.dataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:@"jio_money" APIClient:client];
    
   
    
    
    
    
    
    TWTRTweetHashtagEntity *entit = [[TWTRTweetHashtagEntity alloc] initWithStartIndex:0 endIndex:10];
    NSLog(@"entit.text: %@", entit.text);
    
    
    NSLog(@"TWTRTweetHashtagEntity11 : %@" , entit.text);
   
    
    
    TWTRTweetHashtagEntity *entity;
    if (entity) {
        NSLog(@"hashtag is %@", entity.text);
    }
    
    else
        NSLog(@"failed to fetch hashtags for the account");
    
    NSString *baseUrl = [NSString stringWithFormat:@"%@",[CreateAPIString returnTrendsURL]];
    NSURLRequest * request = [TweetsNetworkServices createGetRequestWithBaseUrl:baseUrl andParamString:@""];
    self.sessionData = [TweetsNetworkServices dataTaskWithRequest:request completionHandler:^(NSData *jsonData, NSURLResponse *response, NSError *error)
                        {
                            dispatch_async(dispatch_get_main_queue(), ^{
                            });
                            if(error)
                            {
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    // Handle error
                                    
                                });
                            }
                            else
                            {
                                NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                                     options:kNilOptions
                                                                                       error:&error];
                                _hashtagsArray  = [[NSArray alloc] initWithObjects:json[@"trends"], nil];
                                
                                NSLog(@"%@", json);
                                
                            }
                            
                        }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_hashtagsArray.count >1 ) {
        return  _hashtagsArray.count;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HashTagTCell *cell =  (HashTagTCell *)[tableView dequeueReusableCellWithIdentifier:@"HashTagTCell"];
    
    
    // Configure the cell...
    
   // cell.delegate= self;
    
    if (!cell) {
        
        cell  =  [HashTagTCell loadFromNib];
        
    }
    
    cell.model = [self.hashtagsArray objectAtIndex:indexPath.row];
    
    return cell;
}

*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
