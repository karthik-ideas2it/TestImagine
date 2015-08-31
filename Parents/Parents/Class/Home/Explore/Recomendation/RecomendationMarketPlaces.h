//
//  RecomendationMarketPlaces.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecomendationMarketPlaces : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) NSArray *events;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
