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
    
    NSLog(@"URL: %@", url);
    
    eatDetailActivityIndictor = [[UIActivityIndicatorView alloc] init];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: url] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    
    [self.eatDetailWebView loadRequest: request];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [eatDetailActivityIndictor startAnimating];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [eatDetailActivityIndictor stopAnimating];
}

@end
