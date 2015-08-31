//
//  RecomendationEvents.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecomendationEvents.h"


NSString *const kRecomendationEventsImages = @"images";
NSString *const kRecomendationEventsCost = @"cost";
NSString *const kRecomendationEventsLocation = @"location";
NSString *const kRecomendationEventsId = @"id";
NSString *const kRecomendationEventsAgegroup = @"agegroup";
NSString *const kRecomendationEventsAreas = @"areas";
NSString *const kRecomendationEventsDescription = @"description";
NSString *const kRecomendationEventsEventdate = @"eventdate";
NSString *const kRecomendationEventsName = @"name";


@interface RecomendationEvents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationEvents

@synthesize images = _images;
@synthesize cost = _cost;
@synthesize location = _location;
@synthesize eventsIdentifier = _eventsIdentifier;
@synthesize agegroup = _agegroup;
@synthesize areas = _areas;
@synthesize eventsDescription = _eventsDescription;
@synthesize eventdate = _eventdate;
@synthesize name = _name;


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
            self.images = [self objectOrNilForKey:kRecomendationEventsImages fromDictionary:dict];
            self.cost = [self objectOrNilForKey:kRecomendationEventsCost fromDictionary:dict];
            self.location = [self objectOrNilForKey:kRecomendationEventsLocation fromDictionary:dict];
            self.eventsIdentifier = [self objectOrNilForKey:kRecomendationEventsId fromDictionary:dict];
            self.agegroup = [self objectOrNilForKey:kRecomendationEventsAgegroup fromDictionary:dict];
            self.areas = [self objectOrNilForKey:kRecomendationEventsAreas fromDictionary:dict];
            self.eventsDescription = [self objectOrNilForKey:kRecomendationEventsDescription fromDictionary:dict];
            self.eventdate = [self objectOrNilForKey:kRecomendationEventsEventdate fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRecomendationEventsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kRecomendationEventsImages];
    [mutableDict setValue:self.cost forKey:kRecomendationEventsCost];
    [mutableDict setValue:self.location forKey:kRecomendationEventsLocation];
    [mutableDict setValue:self.eventsIdentifier forKey:kRecomendationEventsId];
    [mutableDict setValue:self.agegroup forKey:kRecomendationEventsAgegroup];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAreas] forKey:kRecomendationEventsAreas];
    [mutableDict setValue:self.eventsDescription forKey:kRecomendationEventsDescription];
    [mutableDict setValue:self.eventdate forKey:kRecomendationEventsEventdate];
    [mutableDict setValue:self.name forKey:kRecomendationEventsName];

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

    self.images = [aDecoder decodeObjectForKey:kRecomendationEventsImages];
    self.cost = [aDecoder decodeObjectForKey:kRecomendationEventsCost];
    self.location = [aDecoder decodeObjectForKey:kRecomendationEventsLocation];
    self.eventsIdentifier = [aDecoder decodeObjectForKey:kRecomendationEventsId];
    self.agegroup = [aDecoder decodeObjectForKey:kRecomendationEventsAgegroup];
    self.areas = [aDecoder decodeObjectForKey:kRecomendationEventsAreas];
    self.eventsDescription = [aDecoder decodeObjectForKey:kRecomendationEventsDescription];
    self.eventdate = [aDecoder decodeObjectForKey:kRecomendationEventsEventdate];
    self.name = [aDecoder decodeObjectForKey:kRecomendationEventsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_images forKey:kRecomendationEventsImages];
    [aCoder encodeObject:_cost forKey:kRecomendationEventsCost];
    [aCoder encodeObject:_location forKey:kRecomendationEventsLocation];
    [aCoder encodeObject:_eventsIdentifier forKey:kRecomendationEventsId];
    [aCoder encodeObject:_agegroup forKey:kRecomendationEventsAgegroup];
    [aCoder encodeObject:_areas forKey:kRecomendationEventsAreas];
    [aCoder encodeObject:_eventsDescription forKey:kRecomendationEventsDescription];
    [aCoder encodeObject:_eventdate forKey:kRecomendationEventsEventdate];
    [aCoder encodeObject:_name forKey:kRecomendationEventsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationEvents *copy = [[RecomendationEvents alloc] init];
    
    if (copy) {

        copy.images = [self.images copyWithZone:zone];
        copy.cost = [self.cost copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.eventsIdentifier = [self.eventsIdentifier copyWithZone:zone];
        copy.agegroup = [self.agegroup copyWithZone:zone];
        copy.areas = [self.areas copyWithZone:zone];
        copy.eventsDescription = [self.eventsDescription copyWithZone:zone];
        copy.eventdate = [self.eventdate copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
