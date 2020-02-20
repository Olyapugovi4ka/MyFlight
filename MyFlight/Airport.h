//
//  Airport.h
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Airport : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *timezone;
@property (nonatomic ,strong) NSDictionary *translation;
@property (nonatomic ,strong) NSString *countryCode;
@property (nonatomic , strong) NSString *cityCode;
@property (nonatomic ,strong) NSString *code;
@property (nonatomic, getter=isFlightable) BOOL flightanle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
