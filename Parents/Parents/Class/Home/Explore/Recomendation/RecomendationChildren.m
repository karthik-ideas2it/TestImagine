//
//  RecomendationChildren.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import "RecomendationChildren.h"
#import "RecomendationActivities.h"
#import "RecomendationExperiences.h"
#import "RecomendationDiscover.h"
#import "RecomendationMarketPlaces.h"


NSString *const kRecomendationChildrenActivities = @"activities";
NSString *const kRecomendationChildrenId = @"id";
NSString *const kRecomendationChildrenExperiences = @"experiences";
NSString *const kRecomendationChildrenExperienceActivityOrder = @"experience_activity_order";
NSString *const kRecomendationChildrenProductsDisplay = @"products_display";
NSString *const kRecomendationChildrenDiscover = @"discover";
NSString *const kRecomendationChildrenEventsDisplay = @"events_display";
NSString *const kRecomendationChildrenMarketPlaces = @"market_places";
NSString *const kRecomendationChildrenEventsProductsDisplay = @"events_products_display";


@interface RecomendationChildren ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationChildren

@synthesize activities = _activities;
@synthesize childrenIdentifier = _childrenIdentifier;
@synthesize experiences = _experiences;
@synthesize experienceActivityOrder = _experienceActivityOrder;
@synthesize productsDisplay = _productsDisplay;
@synthesize discover = _discover;
@synthesize eventsDisplay = _eventsDisplay;
@synthesize marketPlaces = _marketPlaces;
@synthesize eventsProductsDisplay = _eventsProductsDisplay;


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
    NSObject *receivedRecomendationActivities = [dict objectForKey:kRecomendationChildrenActivities];
    NSMutableArray *parsedRecomendationActivities = [NSMutableArray array];
    if ([receivedRecomendationActivities isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecomendationActivities) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecomendationActivities addObject:[RecomendationActivities modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecomendationActivities isKindOfClass:[NSDictionary class]]) {
       [parsedRecomendationActivities addObject:[RecomendationActivities modelObjectWithDictionary:(NSDictionary *)receivedRecomendationActivities]];
    }

    self.activities = [NSArray arrayWithArray:parsedRecomendationActivities];
            self.childrenIdentifier = [self objectOrNilForKey:kRecomendationChildrenId fromDictionary:dict];
    NSObject *receivedRecomendationExperiences = [dict objectForKey:kRecomendationChildrenExperiences];
    NSMutableArray *parsedRecomendationExperiences = [NSMutableArray array];
    if ([receivedRecomendationExperiences isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecomendationExperiences) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecomendationExperiences addObject:[RecomendationExperiences modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecomendationExperiences isKindOfClass:[NSDictionary class]]) {
       [parsedRecomendationExperiences addObject:[RecomendationExperiences modelObjectWithDictionary:(NSDictionary *)receivedRecomendationExperiences]];
    }

    self.experiences = [NSArray arrayWithArray:parsedRecomendationExperiences];
            self.experienceActivityOrder = [self objectOrNilForKey:kRecomendationChildrenExperienceActivityOrder fromDictionary:dict];
            self.productsDisplay = [self objectOrNilForKey:kRecomendationChildrenProductsDisplay fromDictionary:dict];
    NSObject *receivedRecomendationDiscover = [dict objectForKey:kRecomendationChildrenDiscover];
    NSMutableArray *parsedRecomendationDiscover = [NSMutableArray array];
    if ([receivedRecomendationDiscover isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecomendationDiscover) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecomendationDiscover addObject:[RecomendationDiscover modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecomendationDiscover isKindOfClass:[NSDictionary class]]) {
       [parsedRecomendationDiscover addObject:[RecomendationDiscover modelObjectWithDictionary:(NSDictionary *)receivedRecomendationDiscover]];
    }

    self.discover = [NSArray arrayWithArray:parsedRecomendationDiscover];
            self.eventsDisplay = [self objectOrNilForKey:kRecomendationChildrenEventsDisplay fromDictionary:dict];
            self.marketPlaces = [RecomendationMarketPlaces modelObjectWithDictionary:[dict objectForKey:kRecomendationChildrenMarketPlaces]];
            self.eventsProductsDisplay = [self objectOrNilForKey:kRecomendationChildrenEventsProductsDisplay fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForActivities = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activities) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivities addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivities addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivities] forKey:kRecomendationChildrenActivities];
    [mutableDict setValue:self.childrenIdentifier forKey:kRecomendationChildrenId];
    NSMutableArray *tempArrayForExperiences = [NSMutableArray array];
    for (NSObject *subArrayObject in self.experiences) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForExperiences addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForExperiences addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForExperiences] forKey:kRecomendationChildrenExperiences];
    NSMutableArray *tempArrayForExperienceActivityOrder = [NSMutableArray array];
    for (NSObject *subArrayObject in self.experienceActivityOrder) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForExperienceActivityOrder addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForExperienceActivityOrder addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForExperienceActivityOrder] forKey:kRecomendationChildrenExperienceActivityOrder];
    NSMutableArray *tempArrayForProductsDisplay = [NSMutableArray array];
    for (NSObject *subArrayObject in self.productsDisplay) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProductsDisplay addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProductsDisplay addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductsDisplay] forKey:kRecomendationChildrenProductsDisplay];
    NSMutableArray *tempArrayForDiscover = [NSMutableArray array];
    for (NSObject *subArrayObject in self.discover) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiscover addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiscover addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiscover] forKey:kRecomendationChildrenDiscover];
    NSMutableArray *tempArrayForEventsDisplay = [NSMutableArray array];
    for (NSObject *subArrayObject in self.eventsDisplay) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEventsDisplay addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEventsDisplay addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEventsDisplay] forKey:kRecomendationChildrenEventsDisplay];
    [mutableDict setValue:[self.marketPlaces dictionaryRepresentation] forKey:kRecomendationChildrenMarketPlaces];
    NSMutableArray *tempArrayForEventsProductsDisplay = [NSMutableArray array];
    for (NSObject *subArrayObject in self.eventsProductsDisplay) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEventsProductsDisplay addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEventsProductsDisplay addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEventsProductsDisplay] forKey:kRecomendationChildrenEventsProductsDisplay];

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

    self.activities = [aDecoder decodeObjectForKey:kRecomendationChildrenActivities];
    self.childrenIdentifier = [aDecoder decodeObjectForKey:kRecomendationChildrenId];
    self.experiences = [aDecoder decodeObjectForKey:kRecomendationChildrenExperiences];
    self.experienceActivityOrder = [aDecoder decodeObjectForKey:kRecomendationChildrenExperienceActivityOrder];
    self.productsDisplay = [aDecoder decodeObjectForKey:kRecomendationChildrenProductsDisplay];
    self.discover = [aDecoder decodeObjectForKey:kRecomendationChildrenDiscover];
    self.eventsDisplay = [aDecoder decodeObjectForKey:kRecomendationChildrenEventsDisplay];
    self.marketPlaces = [aDecoder decodeObjectForKey:kRecomendationChildrenMarketPlaces];
    self.eventsProductsDisplay = [aDecoder decodeObjectForKey:kRecomendationChildrenEventsProductsDisplay];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activities forKey:kRecomendationChildrenActivities];
    [aCoder encodeObject:_childrenIdentifier forKey:kRecomendationChildrenId];
    [aCoder encodeObject:_experiences forKey:kRecomendationChildrenExperiences];
    [aCoder encodeObject:_experienceActivityOrder forKey:kRecomendationChildrenExperienceActivityOrder];
    [aCoder encodeObject:_productsDisplay forKey:kRecomendationChildrenProductsDisplay];
    [aCoder encodeObject:_discover forKey:kRecomendationChildrenDiscover];
    [aCoder encodeObject:_eventsDisplay forKey:kRecomendationChildrenEventsDisplay];
    [aCoder encodeObject:_marketPlaces forKey:kRecomendationChildrenMarketPlaces];
    [aCoder encodeObject:_eventsProductsDisplay forKey:kRecomendationChildrenEventsProductsDisplay];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationChildren *copy = [[RecomendationChildren alloc] init];
    
    if (copy) {

        copy.activities = [self.activities copyWithZone:zone];
        copy.childrenIdentifier = [self.childrenIdentifier copyWithZone:zone];
        copy.experiences = [self.experiences copyWithZone:zone];
        copy.experienceActivityOrder = [self.experienceActivityOrder copyWithZone:zone];
        copy.productsDisplay = [self.productsDisplay copyWithZone:zone];
        copy.discover = [self.discover copyWithZone:zone];
        copy.eventsDisplay = [self.eventsDisplay copyWithZone:zone];
        copy.marketPlaces = [self.marketPlaces copyWithZone:zone];
        copy.eventsProductsDisplay = [self.eventsProductsDisplay copyWithZone:zone];
    }
    
    return copy;
}


@end
