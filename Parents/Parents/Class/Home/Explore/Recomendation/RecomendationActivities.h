//
//  RecomendationActivities.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecomendationActivities : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *estimatedCost;
@property (nonatomic, strong) NSString *activitiesIdentifier;
@property (nonatomic, strong) NSString *urlType;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong) NSString *activitiesDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
