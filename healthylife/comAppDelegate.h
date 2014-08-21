//
//  comAppDelegate.h
//  healthylife
//
//  Created by Tony Keung on 19/8/14.
//
//


#import <UIKit/UIKit.h>
#import "comViewController.h"

@interface comAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) comViewController *RootViewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
