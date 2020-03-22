#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = [self.data objectForKey:@"result"];
    UIImage *image = [UIImage imageNamed: [dic objectForKey:@"imageUrl"]];
    [self.imageView setImage: image];
    
    NSString *name = @"Name: ";
    self.nameLabel.text = [name stringByAppendingString: [dic objectForKey:@"name"]];
    
    NSString *age = @"Aage: ";
    self.ageLabel.text = [age stringByAppendingFormat: @"%@", [dic objectForKey:@"age"]];
    
    NSString *phone = @"Phone: ";
    self.phoneLabel.text = [phone stringByAppendingString: [dic objectForKey:@"phone"]];
}

@end
