#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController {
    NSMutableArray *images;
    NSMutableData *myData;
    NSString *selectedImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageTable.dataSource = self;
    _imageTable.delegate = self;
    
    images = [[NSMutableArray alloc] initWithCapacity: 5];
    
    [images addObject: @"son.png"];
    [images addObject: @"daughter.png"];
    [images addObject: @"father.png"];
    [images addObject: @"mother.png"];
    [images addObject: @"grandfather.png"];
    
    myData = [NSMutableData new];
    selectedImage = [images objectAtIndex: 0];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.imageTable dequeueReusableCellWithIdentifier: @"cell"];
    cell.imageView.image = [UIImage imageNamed: [images objectAtIndex: indexPath.row]];
    
    NSString *str = [images objectAtIndex: indexPath.row];
    str = [str substringToIndex: (str.length - 4)];
    cell.textLabel.text = str;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedImage = [images objectAtIndex: indexPath.row];
}

- (void)setLatitude:(float)lat andLognitude :(float)lon {
    self.latitude = lat;
    self.longitude = lon;
}

- (IBAction)openMap:(UIButton *)sender {
    MapViewController *mapView = [self.storyboard instantiateViewControllerWithIdentifier: @"mapView"];
    [mapView setLatAndLonProt: self];
    
    [self.navigationController pushViewController: mapView animated: YES];
}

- (IBAction)registeruser:(UIButton *)sender {
    NSString *str = @"http://jets.iti.gov.eg/FriendsApp/services/user/register?name=";
    str = [str stringByAppendingString: _nameTF.text];
    str = [str stringByAppendingString: @"&phone="];
    str = [str stringByAppendingString: _phoneTF.text];
    str = [str stringByAppendingString: @"&age="];
    str = [str stringByAppendingString: _ageTF.text];
    str = [str stringByAppendingString: @"&imageURL="];
    str = [str stringByAppendingString: selectedImage];
    str = [str stringByAppendingString: @"&lognitude="];
    str = [str stringByAppendingFormat: @"%f", _longitude];
    str = [str stringByAppendingString: @"&latitude="];
    str = [str stringByAppendingFormat: @"%f", _longitude];
    
    printf("%s\n", [str UTF8String]);
    
    NSURL *url = [NSURL URLWithString: str];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    [con start];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [myData appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData: myData options: nil error: nil];
    NSString *status = [dic objectForKey: @"status"];
    
    if ([status isEqualToString: @"SUCCESS"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Registration" message:@"SUCCESS" delegate: self cancelButtonTitle: nil otherButtonTitles: @"OK", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Registration" message:@"FAILED" delegate: self cancelButtonTitle: nil otherButtonTitles: @"RETRY", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([[alertView buttonTitleAtIndex: buttonIndex] isEqualToString: @"OK"]) {
        [self.navigationController popViewControllerAnimated: YES];
    }
}

@end
