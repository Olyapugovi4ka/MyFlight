//
//  Country.h
//  MyFlight
//
//  Created by Olga Melnik on 20.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSDictionary *translation;
@property (nonatomic, strong) NSString *code;

- (instancetype)initWithDictionary: (NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
