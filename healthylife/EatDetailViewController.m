//
//  EatDetailViewController.m
//  healthylife
//
//  Created by Tony Keung on 22/8/14.
//
//

#import "EatDetailViewController.h"

@interface EatDetailViewController ()

@end

@implementation EatDetailViewController

@synthesize eatDetailWebView;
@synthesize url;
@synthesize title;
@synthesize eatDetailActivityIndictor;

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
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: url] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [self setTitle:title];
    [self.eatDetailWebView loadRequest: request];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"Stop Loading");
    [eatDetailActivityIndictor stopAnimating];
    eatDetailActivityIndictor.hidden = YES;
    //[eatDetailActivityIndictor removeFromSuperview];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"Start Loading");
    [eatDetailActivityIndictor startAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [eatDetailActivityIndictor stopAnimating];
    eatDetailActivityIndictor.hidden = YES;
}

@end
