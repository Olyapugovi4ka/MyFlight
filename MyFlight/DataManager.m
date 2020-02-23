//
//  DataManager.m
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import "DataManager.h"
@interface DataManager()

@property (nonatomic, strong) NSMutableArray *countriesArray;
@property (nonatomic, strong) NSMutableArray *citiesArray;
@property (nonatomic, strong) NSMutableArray *airportsArray;

@end

@implementation DataManager
 
//singletone
+(instancetype)sharedInstance {
    static DataManager* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        instance = [[DataManager alloc] init];
    });
    return instance;
}

- (void)loadData {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSArray *countriesJsonArray = [self arrayFromFileName:@"countries" ofType:@"json"];
        _countriesArray = [self createObjectsFromArray:countriesJsonArray withType:DataSourseTypeCountry];
        
        NSArray *citiesJsonArray = [self arrayFromFileName:@"cities" ofType:@"json"];
        _citiesArray = [self createObjectsFromArray:citiesJsonArray withType:DataSourceTypeCity];
        
        NSArray*airportsJsonArray = [self arrayFromFileName:@"airports" ofType:@"json"];
        _airportsArray = [self createObjectsFromArray:airportsJsonArray withType:DataSourceTypeArport];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kDataMAnagerLoadDataDidComplete object:nil];
        });
        NSLog(@"Complete load data");
    });
}

- (NSMutableArray *)createObjectsFromArray:(NSArray *)array withType: (DataSourceType)type {
    NSMutableArray *results = [NSMutableArray new];
    for (NSDictionary *jsonObject in array){
        if (type == DataSourseTypeCountry) {
            Country *country = [[Country alloc] initWithDictionary:jsonObject];
            [results addObject:country];
        }
        else if (type == DataSourceTypeCity) {
            City *city  = [[City alloc] initWithDictionary:jsonObject];
            [results addObject: city];
        }
        else if (type == DataSourceTypeArport){
            Airport *aiport = [[Airport alloc]initWithDictionary:jsonObject];
            [results addObject: aiport];
        }
    }
    return results;
}

- (NSArray*)arrayFromFileName:(NSString *)fileName ofType:(NSString *)type {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData* data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

-(NSArray *)countries {
    return _countriesArray;
}

- (NSArray *)cities {
    return _citiesArray;
}

- (NSArray *)airports {
    return _airportsArray;
}


@end
