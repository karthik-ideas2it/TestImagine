//
//  RecomendationChildren.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecomendationMarketPlaces;

@interface RecomendationChildren : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *activities;
@property (nonatomic, strong) NSString *childrenIdentifier;
@property (nonatomic, strong) NSArray *experiences;
@property (nonatomic, strong) NSArray *experienceActivityOrder;
@property (nonatomic, strong) NSArray *productsDisplay;
@property (nonatomic, strong) NSArray *discover;
@property (nonatomic, strong) NSArray *eventsDisplay;
@property (nonatomic, strong) RecomendationMarketPlaces *marketPlaces;
@property (nonatomic, strong) NSArray *eventsProductsDisplay;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
