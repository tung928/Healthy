//
//  EatViewController.m
//  healthylife
//
//  Created by Tony Keung on 20/8/14.
//
//

#import "EatViewController.h"
#import "AFHTTPRequestOperation.h"
#import "UIActivityIndicatorView+AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "EatDetailViewController.h"
#import "EatTableViewCell.h"

@interface EatViewController ()

@end

@implementation EatViewController
@synthesize eatListTableView,eatListArr,eatViewIndicator;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    eatListArr = [[NSMutableArray alloc] init];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [self getJSon];
    [eatViewIndicator startAnimating];
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
    //[self.navigationController setTitle:@"Eat"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setTitle:@"食得健康"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getJSon{
    NSLog(@"Get JSon");
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.leadingtech.org/healthylife/eat.json"]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    //[eatViewIndicator startAnimating];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation
                                               , id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            NSLog(@"Eat List Dictionary Detected");
            eatListDict = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
            eatListArr =[eatListDict valueForKey:@"eat_list"];
            NSLog(@"Eat List Array Size: %i", [eatListArr count]);
            [eatViewIndicator stopAnimating];
            eatViewIndicator.hidden = YES;
            [eatListTableView reloadData];
            
        }else {
            //NSLog(@"Eat List Array Detected");
        }
        //[eatViewIndicator stopAnimating];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Handle error
        //[eatViewIndicator stopAnimating];
        [operation cancel];
    }];
    
    [operation start];
    
}

#pragma UITableViewController Delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EatDetailViewController *eatDetailViewController = [[EatDetailViewController alloc] init];
    NSMutableDictionary *eatDict = [eatListArr objectAtIndex:indexPath.row];
    eatDetailViewController.url = [eatDict objectForKey:@"url"];
    eatDetailViewController.title = [eatDict objectForKey:@"title"];
                                   
    [self.navigationController pushViewController:eatDetailViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
#ifdef DEBUG
    NSLog(@"%lu", (unsigned long)[eatListArr count]);
#endif
    return [eatListArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *eatDetailCell = @"EatDetailCell";
    
    //static BOOL isRegNib = NO;
    //if (!isRegNib) {
        [tableView registerNib:[UINib nibWithNibName:@"EatTableViewCell" bundle:nil] forCellReuseIdentifier:eatDetailCell];
        //isRegNib = YES;
    //}
    
    EatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:eatDetailCell];
    
    NSMutableDictionary *eatDict = [eatListArr objectAtIndex:indexPath.row];
    // Configure the cell...
    cell.titleLbl.text = [eatDict valueForKey:@"title"];
    cell.thumbImg.image = [UIImage imageNamed:@"eat.gif"];
    cell.sourceLbl.text = [eatDict valueForKey:@"source"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

@end
