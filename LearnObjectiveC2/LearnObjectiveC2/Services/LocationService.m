//
//  LocationService.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 03/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "LocationService.h"

@interface LocationService () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        [self.locationManager requestAlwaysAuthorization];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"Access granted");
        [self.locationManager startUpdatingLocation];
    } else if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"Access denied");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
        NSLog(@"%@", [locations firstObject]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kLocationUpdate object:[locations firstObject]];
}

@end
