//
//  LatitudeAndLogitude.h
//  RegisterAndLoginWithMap
//
//  Created by ahmedpro on 3/22/20.
//  Copyright © 2020 ahmedpro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LatitudeAndLogitude <NSObject>

- (void) setLatitude: (float) lat andLognitude: (float) lon;

@end

NS_ASSUME_NONNULL_END
