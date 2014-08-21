//
//  comViewController.h
//  healthylife
//
//  Created by Tony Keung on 19/8/14.
//
//

#import <UIKit/UIKit.h>
#import "EatViewController.h"

@interface comViewController : UIViewController{
    EatViewController *eatViewController;
}

- (IBAction)gotoEatView:(id)sender;

@end
