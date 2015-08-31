//
//  RecomendationBaseClass.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecomendationBaseClass.h"
#import "RecomendationChildren.h"
#import "RecomendationNotifications.h"


NSString *const kRecomendationBaseClassExperienceActivityDisplay = @"experience_activity_display";
NSString *const kRecomendationBaseClassDiscoverDisplay = @"discover_display";
NSString *const kRecomendationBaseClassChildren = @"children";
NSString *const kRecomendationBaseClassProductsDisplay = @"products_display";
NSString *const kRecomendationBaseClassVersion = @"version";
NSString *const kRecomendationBaseClassEventsDisplay = @"events_display";
NSString *const kRecomendationBaseClassEventsProductsDisplay = @"events_products_display";
NSString *const kRecomendationBaseClassNotifications = @"notifications";


@interface RecomendationBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationBaseClass

@synthesize experienceActivityDisplay = _experienceActivityDisplay;
@synthesize discoverDisplay = _discoverDisplay;
@synthesize children = _children;
@synthesize productsDisplay = _productsDisplay;
@synthesize version = _version;
@synthesize eventsDisplay = _eventsDisplay;
@synthesize eventsProductsDisplay = _eventsProductsDisplay;
@synthesize notifications = _notifications;


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
            self.experienceActivityDisplay = [self objectOrNilForKey:kRecomendationBaseClassExperienceActivityDisplay fromDictionary:dict];
            self.discoverDisplay = [self objectOrNilForKey:kRecomendationBaseClassDiscoverDisplay fromDictionary:dict];
    NSObject *receivedRecomendationChildren = [dict objectForKey:kRecomendationBaseClassChildren];
    NSMutableArray *parsedRecomendationChildren = [NSMutableArray array];
    if ([receivedRecomendationChildren isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecomendationChildren) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecomendationChildren addObject:[RecomendationChildren modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecomendationChildren isKindOfClass:[NSDictionary class]]) {
       [parsedRecomendationChildren addObject:[RecomendationChildren modelObjectWithDictionary:(NSDictionary *)receivedRecomendationChildren]];
    }

    self.children = [NSArray arrayWithArray:parsedRecomendationChildren];
            self.productsDisplay = [self objectOrNilForKey:kRecomendationBaseClassProductsDisplay fromDictionary:dict];
            self.version = [self objectOrNilForKey:kRecomendationBaseClassVersion fromDictionary:dict];
            self.eventsDisplay = [self objectOrNilForKey:kRecomendationBaseClassEventsDisplay fromDictionary:dict];
            self.eventsProductsDisplay = [self objectOrNilForKey:kRecomendationBaseClassEventsProductsDisplay fromDictionary:dict];
            self.notifications = [RecomendationNotifications modelObjectWithDictionary:[dict objectForKey:kRecomendationBaseClassNotifications]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForExperienceActivityDisplay = [NSMutableArray array];
    for (NSObject *subArrayObject in self.experienceActivityDisplay) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForExperienceActivityDisplay addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForExperienceActivityDisplay addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForExperienceActivityDisplay] forKey:kRecomendationBaseClassExperienceActivityDisplay];
    NSMutableArray *tempArrayForDiscoverDisplay = [NSMutableArray array];
    for (NSObject *subArrayObject in self.discoverDisplay) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiscoverDisplay addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiscoverDisplay addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiscoverDisplay] forKey:kRecomendationBaseClassDiscoverDisplay];
    NSMutableArray *tempArrayForChildren = [NSMutableArray array];
    for (NSObject *subArrayObject in self.children) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChildren addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChildren addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChildren] forKey:kRecomendationBaseClassChildren];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProductsDisplay] forKey:kRecomendationBaseClassProductsDisplay];
    [mutableDict setValue:self.version forKey:kRecomendationBaseClassVersion];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEventsDisplay] forKey:kRecomendationBaseClassEventsDisplay];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEventsProductsDisplay] forKey:kRecomendationBaseClassEventsProductsDisplay];
    [mutableDict setValue:[self.notifications dictionaryRepresentation] forKey:kRecomendationBaseClassNotifications];

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

    self.experienceActivityDisplay = [aDecoder decodeObjectForKey:kRecomendationBaseClassExperienceActivityDisplay];
    self.discoverDisplay = [aDecoder decodeObjectForKey:kRecomendationBaseClassDiscoverDisplay];
    self.children = [aDecoder decodeObjectForKey:kRecomendationBaseClassChildren];
    self.productsDisplay = [aDecoder decodeObjectForKey:kRecomendationBaseClassProductsDisplay];
    self.version = [aDecoder decodeObjectForKey:kRecomendationBaseClassVersion];
    self.eventsDisplay = [aDecoder decodeObjectForKey:kRecomendationBaseClassEventsDisplay];
    self.eventsProductsDisplay = [aDecoder decodeObjectForKey:kRecomendationBaseClassEventsProductsDisplay];
    self.notifications = [aDecoder decodeObjectForKey:kRecomendationBaseClassNotifications];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_experienceActivityDisplay forKey:kRecomendationBaseClassExperienceActivityDisplay];
    [aCoder encodeObject:_discoverDisplay forKey:kRecomendationBaseClassDiscoverDisplay];
    [aCoder encodeObject:_children forKey:kRecomendationBaseClassChildren];
    [aCoder encodeObject:_productsDisplay forKey:kRecomendationBaseClassProductsDisplay];
    [aCoder encodeObject:_version forKey:kRecomendationBaseClassVersion];
    [aCoder encodeObject:_eventsDisplay forKey:kRecomendationBaseClassEventsDisplay];
    [aCoder encodeObject:_eventsProductsDisplay forKey:kRecomendationBaseClassEventsProductsDisplay];
    [aCoder encodeObject:_notifications forKey:kRecomendationBaseClassNotifications];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationBaseClass *copy = [[RecomendationBaseClass alloc] init];
    
    if (copy) {

        copy.experienceActivityDisplay = [self.experienceActivityDisplay copyWithZone:zone];
        copy.discoverDisplay = [self.discoverDisplay copyWithZone:zone];
        copy.children = [self.children copyWithZone:zone];
        copy.productsDisplay = [self.productsDisplay copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
        copy.eventsDisplay = [self.eventsDisplay copyWithZone:zone];
        copy.eventsProductsDisplay = [self.eventsProductsDisplay copyWithZone:zone];
        copy.notifications = [self.notifications copyWithZone:zone];
    }
    
    return copy;
}


@end
