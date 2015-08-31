//
//  RecomendationProducts.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecomendationProducts.h"


NSString *const kRecomendationProductsCost = @"cost";
NSString *const kRecomendationProductsId = @"id";
NSString *const kRecomendationProductsName = @"name";
NSString *const kRecomendationProductsDescription = @"description";
NSString *const kRecomendationProductsAreas = @"areas";


@interface RecomendationProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationProducts

@synthesize cost = _cost;
@synthesize productsIdentifier = _productsIdentifier;
@synthesize name = _name;
@synthesize productsDescription = _productsDescription;
@synthesize areas = _areas;


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
            self.cost = [self objectOrNilForKey:kRecomendationProductsCost fromDictionary:dict];
            self.productsIdentifier = [self objectOrNilForKey:kRecomendationProductsId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRecomendationProductsName fromDictionary:dict];
            self.productsDescription = [self objectOrNilForKey:kRecomendationProductsDescription fromDictionary:dict];
            self.areas = [self objectOrNilForKey:kRecomendationProductsAreas fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cost forKey:kRecomendationProductsCost];
    [mutableDict setValue:self.productsIdentifier forKey:kRecomendationProductsId];
    [mutableDict setValue:self.name forKey:kRecomendationProductsName];
    [mutableDict setValue:self.productsDescription forKey:kRecomendationProductsDescription];
    NSMutableArray *tempArrayForAreas = [NSMutableArray array];
    for (NSObject *subArrayObject in self.areas) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAreas addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAreas addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAreas] forKey:kRecomendationProductsAreas];

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

    self.cost = [aDecoder decodeObjectForKey:kRecomendationProductsCost];
    self.productsIdentifier = [aDecoder decodeObjectForKey:kRecomendationProductsId];
    self.name = [aDecoder decodeObjectForKey:kRecomendationProductsName];
    self.productsDescription = [aDecoder decodeObjectForKey:kRecomendationProductsDescription];
    self.areas = [aDecoder decodeObjectForKey:kRecomendationProductsAreas];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cost forKey:kRecomendationProductsCost];
    [aCoder encodeObject:_productsIdentifier forKey:kRecomendationProductsId];
    [aCoder encodeObject:_name forKey:kRecomendationProductsName];
    [aCoder encodeObject:_productsDescription forKey:kRecomendationProductsDescription];
    [aCoder encodeObject:_areas forKey:kRecomendationProductsAreas];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationProducts *copy = [[RecomendationProducts alloc] init];
    
    if (copy) {

        copy.cost = [self.cost copyWithZone:zone];
        copy.productsIdentifier = [self.productsIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.productsDescription = [self.productsDescription copyWithZone:zone];
        copy.areas = [self.areas copyWithZone:zone];
    }
    
    return copy;
}


@end
