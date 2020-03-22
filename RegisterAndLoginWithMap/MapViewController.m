#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController {
    MyAnnotation *an;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle: @"done" style: UIBarButtonItemStylePlain target: self action: @selector(done)];
    [self.navigationItem setRightBarButtonItem: doneItem];
    
    an = [MyAnnotation new];
}

- (void) done {
    float latitude = an.coordinate.latitude;
    float longitude = an.coordinate.longitude;
    [self.latAndLonProt setLatitude: latitude andLognitude: longitude];
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction)send:(id)sender {
    CGPoint point = [sender locationInView: _mapView];
    CLLocationCoordinate2D coordinator = [_mapView convertPoint: point toCoordinateFromView: _mapView];
    an.title = @"selected location";
    an.subtitle = @"";
    an.coordinate = coordinator;
    
    [_mapView addAnnotation: an];
}
@end
