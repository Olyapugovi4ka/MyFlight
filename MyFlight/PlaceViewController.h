//
//  PlaceViewController.h
//  MyFlight
//
//  Created by Olga Melnik on 23.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "UIColor+ColorsOfApp.h"
#import "PlaceCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum PlaceType{
    PlaceTypeArrival,
    PlaceTypeDeparture
}PlaceType;

@protocol PlaceViewControllerDelegate <NSObject>
-(void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;
@end

@interface PlaceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) id<PlaceViewControllerDelegate>delegate;
-(instancetype)initWithType:(PlaceType)placeType;


@end

NS_ASSUME_NONNULL_END
