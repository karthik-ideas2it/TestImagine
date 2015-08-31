//
//  RecomendationProducts.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecomendationProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cost;
@property (nonatomic, strong) NSString *productsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *productsDescription;
@property (nonatomic, strong) NSArray *areas;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
