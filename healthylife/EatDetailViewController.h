//
//  EatDetailViewController.h
//  healthylife
//
//  Created by Tony Keung on 22/8/14.
//
//

#import <UIKit/UIKit.h>

@interface EatDetailViewController : UIViewController <UIWebViewDelegate>{
    
}

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *title;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *eatDetailActivityIndictor;
@property (weak, nonatomic) IBOutlet UIWebView *eatDetailWebView;

@end
