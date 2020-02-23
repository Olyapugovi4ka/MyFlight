//
//  MainViewController.h
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "PlaceViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef struct  SearchRequest {
    __unsafe_unretained NSString *origin;
    __unsafe_unretained NSString *destination;
    __unsafe_unretained NSDate *departDate;
    __unsafe_unretained NSDate *returnDate;
}SearchRequest;

@interface MainViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
