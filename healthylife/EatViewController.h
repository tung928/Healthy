//
//  EatViewController.h
//  healthylife
//
//  Created by Tony Keung on 20/8/14.
//
//

#import <UIKit/UIKit.h>

@interface EatViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableDictionary *eatListDict;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *eatViewIndicator;
@property (weak, nonatomic) IBOutlet UITableView *eatListTableView;
@property (strong, nonatomic) NSMutableArray *eatListArr;

@end
