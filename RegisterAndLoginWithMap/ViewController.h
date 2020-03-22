#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTV;
- (IBAction)login:(UIButton *)sender;
- (IBAction)register:(UIButton *)sender;

@end

