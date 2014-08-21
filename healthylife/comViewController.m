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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoEatView:(id)sender {
    NSLog(@"Eat View Button Clicked");
    eatViewController = [[EatViewController alloc]init];
//    UINavigationController *navigationController =
//    [[UINavigationController alloc] initWithRootViewController:eatViewController];
//    navigationController.title = @"Eat View";
    [self.navigationController pushViewController:eatViewController animated:YES];
}
@end
