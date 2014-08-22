//
//  EatDetailViewController.h
//  healthylife
//
//  Created by Tony Keung on 22/8/14.
//
//

#import <UIKit/UIKit.h>

@interface EatDetailViewController : UIViewController <UIWebViewDelegate>{
    UIActivityIndicatorView *eatDetailActivityIndictor;
}

@property (strong, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *eatDetailWebView;

@end
