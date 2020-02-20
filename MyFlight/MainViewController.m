//
//  MainViewController.m
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//TODO скрыть navigationbar при загрузке контроллера
    [[DataManager sharedInstance] loadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete) name:kDataMAnagerLoadDataDidComplete object:nil];
    
}

-(void)loadDataComplete{
    self.view.backgroundColor = [UIColor yellowColor];
    
}


@end
