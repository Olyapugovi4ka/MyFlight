//
//  MainViewController.m
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <PlaceViewControllerDelegate>

@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic) SearchRequest searchrequest;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//TODO скрыть navigationbar при загрузке контроллера
    [[DataManager sharedInstance] loadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete) name:kDataMAnagerLoadDataDidComplete object:nil];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.title = @"Search";
    
    _departureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_departureButton setTitle:@"From" forState:UIControlStateNormal];
    _departureButton.tintColor = [UIColor blackColor];
    _departureButton.frame = CGRectMake(30.0, 200.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    _departureButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:_departureButton];
    
    _arrivalButton  = [UIButton buttonWithType:UIButtonTypeSystem];
    [_arrivalButton setTitle:@"To" forState:UIControlStateNormal];
    _arrivalButton.tintColor = [UIColor blackColor];
    _arrivalButton.frame = CGRectMake(30.0, CGRectGetMaxY(_departureButton.frame) + 20, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    _arrivalButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:_arrivalButton];
}

-(void)placeButtonDidTap:(UIButton *)sender {
    PlaceViewController *placeViewController;
    if (sender == _departureButton) {
        placeViewController = [[PlaceViewController alloc] initWithType:PlaceTypeDeparture];
    } else {
        placeViewController = [[PlaceViewController alloc] initWithType:PlaceTypeArrival];
    }
    placeViewController.delegate = self;
    [self.navigationController pushViewController:placeViewController animated:YES];
}

-(void)loadDataComplete{
    self.view.backgroundColor = [UIColor yellowColor];
    
}


- (void)selectPlace:(nonnull id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {
    [self setPlace:place withDataType:dataType andPlaceType:placeType forButton:(placeType == PlaceTypeDeparture ? _departureButton : _arrivalButton)];
}

-(void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {
    NSString *title;
    NSString *iata;
    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        iata = city.code;
    } else if (dataType == DataSourceTypeArport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        iata = airport.code;
    }
    if (placeType == PlaceTypeDeparture) {
        _searchrequest.origin = iata;
    } else {
        _searchrequest.destination = iata;
    }
    [button setTitle:title forState:UIControlStateNormal];
}

@end
