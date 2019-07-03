//
//  MapViewController.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 03/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController

@property (nonatomic, strong) CLLocation *coordinate;
@property (nonatomic, strong) CLLocation *currentCoordinate;

@end
