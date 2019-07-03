//
//  MapViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 03/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) LocationService *service;
@property (nonatomic) double latitudinalMeters;
@property (nonatomic) double longitudinalMeters;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.latitudinalMeters = 1000.0;
    self.longitudinalMeters = 1000.0;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.service = [[LocationService alloc] init];
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.mapView setDelegate:self];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setShowsScale:YES]; //Не работает
    [self.mapView setShowsCompass:YES]; //Не работает
    
    UIButton *buttonZoomIn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 40, 40)];
    [buttonZoomIn setTitle:@"+" forState:UIControlStateNormal];
    [buttonZoomIn setBackgroundColor:[UIColor lightGrayColor]];
    [buttonZoomIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonZoomIn addTarget:self action:@selector(zoomIn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonZoomOut = [[UIButton alloc] initWithFrame:CGRectMake(10, 145, 40, 40)];
    [buttonZoomOut setTitle:@"-" forState:UIControlStateNormal];
    [buttonZoomOut setBackgroundColor:[UIColor lightGrayColor]];
    [buttonZoomOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonZoomOut addTarget:self action:@selector(zoomOut) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationWasUpdate:) name:kLocationUpdate object:nil];
    
    [self.view addSubview:self.mapView];
    [self.view addSubview:buttonZoomIn];
    [self.view addSubview:buttonZoomOut];
    
}

- (void)locationWasUpdate:(NSNotification*)notification {
    CLLocation *location = notification.object;
    CLLocationCoordinate2D coordinate = location.coordinate;
    self.currentCoordinate = location;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, self.latitudinalMeters, self.longitudinalMeters);
    [self.mapView setRegion:region animated:YES];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"I'm here";
    annotation.subtitle = @"What is this place?";
    annotation.coordinate = coordinate;
    [self.mapView addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifer = @"Marker";
    MKMarkerAnnotationView *marker = (MKMarkerAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    if (!marker) {
        marker = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifer];
        marker.canShowCallout = true;
        marker.calloutOffset = CGPointMake(-5, 5);
        marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        marker.rightCalloutAccessoryView = button;
    }
    marker.annotation = annotation;
    
    return marker;
    
}

- (void)buttonPressed {
    NSLog(@"Button pressed");
}

- (void)zoomIn {
    if (self.latitudinalMeters > 1000) {
        self.latitudinalMeters -= 1000;
        self.longitudinalMeters -= 1000;
    } else {
        self.latitudinalMeters -= 100;
        self.longitudinalMeters -= 100;
    }
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.currentCoordinate.coordinate, self.latitudinalMeters, self.longitudinalMeters);
    [self.mapView setRegion:region animated:YES];
}

- (void)zoomOut {
    if (self.latitudinalMeters > 1000) {
        self.latitudinalMeters += 1000;
        self.longitudinalMeters += 1000;
    } else {
        self.latitudinalMeters += 100;
        self.longitudinalMeters += 100;
    }
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.currentCoordinate.coordinate, self.latitudinalMeters, self.longitudinalMeters);
    [self.mapView setRegion:region animated:YES];
}

@end
