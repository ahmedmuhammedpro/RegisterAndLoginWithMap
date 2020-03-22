#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LatAndLonProtocol.h"
#import "MyAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <MKMapViewDelegate, LatitudeAndLogitude>

@property id<LatitudeAndLogitude> latAndLonProt;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)send:(id)sender;

@end

NS_ASSUME_NONNULL_END
