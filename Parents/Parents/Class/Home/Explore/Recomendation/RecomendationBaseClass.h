//
//  RecomendationBaseClass.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecomendationNotifications;

@interface RecomendationBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *experienceActivityDisplay;
@property (nonatomic, strong) NSArray *discoverDisplay;
@property (nonatomic, strong) NSArray *children;
@property (nonatomic, strong) NSArray *productsDisplay;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSArray *eventsDisplay;
@property (nonatomic, strong) NSArray *eventsProductsDisplay;
@property (nonatomic, strong) RecomendationNotifications *notifications;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
