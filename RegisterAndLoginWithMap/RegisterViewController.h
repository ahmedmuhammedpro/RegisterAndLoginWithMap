#import <UIKit/UIKit.h>
#import "LatAndLonProtocol.h"
#import "MapViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, LatitudeAndLogitude, NSURLConnectionDelegate, NSURLConnectionDataDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITableView *imageTable;
@property float latitude;
@property float longitude;

- (IBAction)openMap:(UIButton *)sender;

- (IBAction)registeruser:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
