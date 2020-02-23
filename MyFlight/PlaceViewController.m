//
//  PlaceViewController.m
//  MyFlight
//
//  Created by Olga Melnik on 23.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

@property (nonatomic) PlaceType placeType;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *currentArray;

@end

@implementation PlaceViewController

-(instancetype)initWithType:(PlaceType)placeType {
    self = [super init];
    if (self) {
        _placeType = placeType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationController.navigationBar.tintColor = [UIColor flightBlack];
    
    //create table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    //create selected control
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Cities", @"Airports"]];
    [_segmentedControl addTarget:self action:@selector(changeSourse) forControlEvents:UIControlEventValueChanged];
    _segmentedControl.tintColor  = [UIColor blackColor];
    self.navigationItem.titleView = _segmentedControl;
    _segmentedControl.selectedSegmentIndex = 0;
    [self changeSourse];
    
   
}

//method which fills currentArray by values, depending on selected index
-(void)changeSourse {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _currentArray = [[DataManager sharedInstance] cities];
            break;
      case 1:
            _currentArray = [[DataManager sharedInstance] airports];
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}
//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [_currentArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PlaceCell *placeCell = [tableView dequeueReusableCellWithIdentifier:@"PlaceCell"];
    placeCell = [[PlaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PlaceCell"];
    placeCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (_segmentedControl.selectedSegmentIndex == 0){
        City *city = [_currentArray objectAtIndex:indexPath.row];
        placeCell.nameLabel.text = city.name;
        placeCell.codeLabel.text = city.code;
    }
    else if (_segmentedControl.selectedSegmentIndex == 1){
        Airport *airport = [_currentArray objectAtIndex:indexPath.row];
        placeCell.nameLabel.text = airport.name;
        placeCell.codeLabel.text = airport.code;
    }
    return placeCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataSourceType dataType = ((int)_segmentedControl.selectedSegmentIndex) + 1;
    [self.delegate selectPlace:[_currentArray objectAtIndex:indexPath.row] withType:_placeType andDataType:dataType];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
