//
//  RecomendationEvents.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecomendationEvents : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *cost;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *eventsIdentifier;
@property (nonatomic, strong) NSString *agegroup;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong) NSString *eventsDescription;
@property (nonatomic, strong) NSString *eventdate;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
