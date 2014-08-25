//
//  comViewController.m
//  healthylife
//
//  Created by Tony Keung on 19/8/14.
//
//

#import "comViewController.h"

@interface comViewController ()

@end

@implementation comViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self setTitle:@"主頁"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoEatView:(id)sender {
    eatViewController = [[EatViewController alloc]init];
    [self.navigationController pushViewController:eatViewController animated:YES];
}
@end
