//
//  tweetsTableViewController.m
//  FetchTweets
//
//  Created by Prince Kumar on 20/01/18.
//  Copyright © 2018 Jio. All rights reserved.
//

#import "TweetsTableViewController.h"
#import <TwitterKit/TWTRKit.h>
#import "TweetsNetworkServices.h"
#import "CreateAPIString.h"
#import "UserDetails.h"
#import "TweetsModel.h"
#import "TweetsCell.h"



@interface TweetsTableViewController ()

@property(nonatomic, strong) NSArray *tweetsArr;
@property(nonatomic, strong) NSURLSessionDataTask *sessionData;
@property (nonatomic, strong) UserDetails *objectModel;
@property (nonatomic, strong) TweetsModel *TweetsModel;

@end

@implementation UITableViewCell (Nib)


+ (NSString*)nibName {
    return NSStringFromClass(self);
}


+ (NSString*)reuseIdentifier {
    return NSStringFromClass(self);
}

+ (id)loadFromNib {
    return [self loadFromNibName:[self nibName] bundle:nil reuseIdentifier:[self reuseIdentifier]];
}

+ (id)loadFromNib :(NSString *)nibName {
    return [self loadFromNibName:nibName bundle:nil reuseIdentifier:[self reuseIdentifier]];
}


+ (id)loadFromNibName:(NSString*)nibName bundle:(NSBundle*)bundle reuseIdentifier:(NSString*)reuseIdentifier {
    
    if (!bundle) bundle = [NSBundle mainBundle];
    
    NSArray* objects = [bundle loadNibNamed:nibName owner:self options:nil];
    
    if (objects.count == 0) {
        [NSException raise:@"Wrong nib for custom cell" format:@"Can't find nib '%@' for custom cell '%@'", nibName, self];
    }
    
    id cell = nil;
    
    for (id obj in objects) {
        if ([obj isKindOfClass:self]) {
            cell = obj;
            break;
        }
    }
    
    [cell setValue:reuseIdentifier forKey:@"_reuseIdentifier"];
    return cell;
}


@end


@implementation TweetsTableViewController

static NSString * const reuseIdentifier = @"TweetsCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    [self loadTweets];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.tableView registerClass:[TweetsCell class] forCellReuseIdentifier:reuseIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetsCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    self.navigationItem.title = @"JIO";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) fetchData {

    
    NSString *baseUrl = [NSString stringWithFormat:@"%@",[CreateAPIString returnStatusUrl]];
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
                                                _tweetsArr  = [[NSArray alloc] initWithObjects:json[@"tweet"], nil];

                                               NSLog(@"%@", json);

                                           }
    
                                       }];
    
}

-(void) loadTweets{
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    [client loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error) {
        // handle the response or error
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear() called");
    [super viewWillDisappear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_tweetsArr.count >1 ) {
        return  _tweetsArr.count;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetsCell *cell =  (TweetsCell *)[tableView dequeueReusableCellWithIdentifier:@"TweetsCell"];
    
    
    // Configure the cell...
    
    cell.delegate= self;
    
    if (!cell) {
        
        cell  =  [TweetsCell loadFromNib];
        
    }
    
    cell.model = [self.tweetsArr objectAtIndex:indexPath.row];
    
    return cell;

}


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
