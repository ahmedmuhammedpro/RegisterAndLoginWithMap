#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "DetailsViewController.h"

@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTV;
- (IBAction)login:(UIButton *)sender;
- (IBAction)register:(UIButton *)sender;

@end

