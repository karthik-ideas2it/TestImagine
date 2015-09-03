//
//  RecomendationMarketPlaces.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import "RecomendationMarketPlaces.h"
#import "RecomendationProducts.h"
#import "RecomendationEvents.h"


NSString *const kRecomendationMarketPlacesProducts = @"products";
NSString *const kRecomendationMarketPlacesEvents = @"events";


@interface RecomendationMarketPlaces ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationMarketPlaces

@synthesize products = _products;
@synthesize events = _events;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedRecomendationProducts = [dict objectForKey:kRecomendationMarketPlacesProducts];
    NSMutableArray *parsedRecomendationProducts = [NSMutableArray array];
    if ([receivedRecomendationProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecomendationProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecomendationProducts addObject:[RecomendationProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecomendationProducts isKindOfClass:[NSDictionary class]]) {
       [parsedRecomendationProducts addObject:[RecomendationProducts modelObjectWithDictionary:(NSDictionary *)receivedRecomendationProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedRecomendationProducts];
    NSObject *receivedRecomendationEvents = [dict objectForKey:kRecomendationMarketPlacesEvents];
    NSMutableArray *parsedRecomendationEvents = [NSMutableArray array];
    if ([receivedRecomendationEvents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecomendationEvents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecomendationEvents addObject:[RecomendationEvents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecomendationEvents isKindOfClass:[NSDictionary class]]) {
       [parsedRecomendationEvents addObject:[RecomendationEvents modelObjectWithDictionary:(NSDictionary *)receivedRecomendationEvents]];
    }

    self.events = [NSArray arrayWithArray:parsedRecomendationEvents];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.products) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kRecomendationMarketPlacesProducts];
    NSMutableArray *tempArrayForEvents = [NSMutableArray array];
    for (NSObject *subArrayObject in self.events) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEvents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEvents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEvents] forKey:kRecomendationMarketPlacesEvents];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.products = [aDecoder decodeObjectForKey:kRecomendationMarketPlacesProducts];
    self.events = [aDecoder decodeObjectForKey:kRecomendationMarketPlacesEvents];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_products forKey:kRecomendationMarketPlacesProducts];
    [aCoder encodeObject:_events forKey:kRecomendationMarketPlacesEvents];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationMarketPlaces *copy = [[RecomendationMarketPlaces alloc] init];
    
    if (copy) {

        copy.products = [self.products copyWithZone:zone];
        copy.events = [self.events copyWithZone:zone];
    }
    
    return copy;
}


@end
