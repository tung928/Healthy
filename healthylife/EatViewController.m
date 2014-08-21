//
//  EatViewController.m
//  healthylife
//
//  Created by Tony Keung on 20/8/14.
//
//

#import "EatViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFNetworking.h"

@interface EatViewController ()

@end

@implementation EatViewController
@synthesize eatListTableView,eatListArr;


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
    [self getJSon];
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
    //[self.navigationController setTitle:@"Eat"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];

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
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation
                                               , id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            NSLog(@"Eat List Dictionary Detected");
            eatListDict = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
            eatListArr =[eatListDict valueForKey:@"eat_list"];
            NSLog(@"Eat List Array Size: %i", [eatListArr count]);
            [eatListTableView reloadData];
        }else {
            //NSLog(@"Eat List Array Detected");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Handle error
    }];
    
    [operation start];
}

#pragma UITableViewController Delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
#ifdef DEBUG
    NSLog(@"%i", [eatListArr count]);
#endif
    return [eatListArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"Load Table Cell");
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSMutableDictionary *eatDict = [eatListArr objectAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = [eatDict valueForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:@"eat.gif"];
    return cell;
}




@end
