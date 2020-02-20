//
//  DataManager.h
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "City.h"
#import "Airport.h"

#define kDataMAnagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

typedef enum DataSourseType {
    DataSourseTypeCountry,
    DataSourceTypeCity,
    DataSourceTypeArport
} DataSourceType;

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject
@property (nonatomic, strong, readonly) NSArray *countries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

+(instancetype)sharedInstance;
-(void)loadData;

@end

NS_ASSUME_NONNULL_END
