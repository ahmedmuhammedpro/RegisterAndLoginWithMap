#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableData *myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myData = [NSMutableData new];
}

- (IBAction)login:(UIButton *)sender {
    NSString *str = @"http://jets.iti.gov.eg/FriendsApp/services/user/findUser?phone=";
    str = [str stringByAppendingString: _phoneTV.text];
    printf("%s\n", [str UTF8String]);
    NSURL *url = [NSURL URLWithString: str];
    NSURLRequest *req = [NSURLRequest requestWithURL: url];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest: req delegate: self];
    [con start];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [myData appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData: myData options: nil error: nil];
    NSString *status = [dic objectForKey: @"status"];
    printf("%s", [status UTF8String]);
    if ([status isEqualToString: @"SUCCESS"]) {
        DetailsViewController *d = [self.storyboard instantiateViewControllerWithIdentifier: @"details"];
        [d setData: dic];
        [self.navigationController pushViewController: d animated: YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Registration" message:@"FAILING" delegate: self cancelButtonTitle: nil otherButtonTitles: @"RETRY", nil];
        [alert show];
    }
}

- (IBAction)register:(UIButton *)sender {
    RegisterViewController *registerView = [self.storyboard instantiateViewControllerWithIdentifier: @"registerView"];
    [self.navigationController pushViewController:  registerView animated: YES];
}
@end
