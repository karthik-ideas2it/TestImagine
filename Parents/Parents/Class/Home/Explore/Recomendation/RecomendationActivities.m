//
//  RecomendationActivities.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecomendationActivities.h"


NSString *const kRecomendationActivitiesEstimatedCost = @"estimated_cost";
NSString *const kRecomendationActivitiesId = @"id";
NSString *const kRecomendationActivitiesUrlType = @"url_type";
NSString *const kRecomendationActivitiesAreas = @"areas";
NSString *const kRecomendationActivitiesDescription = @"description";
NSString *const kRecomendationActivitiesName = @"name";
NSString *const kRecomendationActivitiesUrl = @"url";


@interface RecomendationActivities ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationActivities

@synthesize estimatedCost = _estimatedCost;
@synthesize activitiesIdentifier = _activitiesIdentifier;
@synthesize urlType = _urlType;
@synthesize areas = _areas;
@synthesize activitiesDescription = _activitiesDescription;
@synthesize name = _name;
@synthesize url = _url;


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
            self.estimatedCost = [self objectOrNilForKey:kRecomendationActivitiesEstimatedCost fromDictionary:dict];
            self.activitiesIdentifier = [self objectOrNilForKey:kRecomendationActivitiesId fromDictionary:dict];
            self.urlType = [self objectOrNilForKey:kRecomendationActivitiesUrlType fromDictionary:dict];
            self.areas = [self objectOrNilForKey:kRecomendationActivitiesAreas fromDictionary:dict];
            self.activitiesDescription = [self objectOrNilForKey:kRecomendationActivitiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRecomendationActivitiesName fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRecomendationActivitiesUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.estimatedCost forKey:kRecomendationActivitiesEstimatedCost];
    [mutableDict setValue:self.activitiesIdentifier forKey:kRecomendationActivitiesId];
    [mutableDict setValue:self.urlType forKey:kRecomendationActivitiesUrlType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAreas] forKey:kRecomendationActivitiesAreas];
    [mutableDict setValue:self.activitiesDescription forKey:kRecomendationActivitiesDescription];
    [mutableDict setValue:self.name forKey:kRecomendationActivitiesName];
    [mutableDict setValue:self.url forKey:kRecomendationActivitiesUrl];

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

    self.estimatedCost = [aDecoder decodeObjectForKey:kRecomendationActivitiesEstimatedCost];
    self.activitiesIdentifier = [aDecoder decodeObjectForKey:kRecomendationActivitiesId];
    self.urlType = [aDecoder decodeObjectForKey:kRecomendationActivitiesUrlType];
    self.areas = [aDecoder decodeObjectForKey:kRecomendationActivitiesAreas];
    self.activitiesDescription = [aDecoder decodeObjectForKey:kRecomendationActivitiesDescription];
    self.name = [aDecoder decodeObjectForKey:kRecomendationActivitiesName];
    self.url = [aDecoder decodeObjectForKey:kRecomendationActivitiesUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_estimatedCost forKey:kRecomendationActivitiesEstimatedCost];
    [aCoder encodeObject:_activitiesIdentifier forKey:kRecomendationActivitiesId];
    [aCoder encodeObject:_urlType forKey:kRecomendationActivitiesUrlType];
    [aCoder encodeObject:_areas forKey:kRecomendationActivitiesAreas];
    [aCoder encodeObject:_activitiesDescription forKey:kRecomendationActivitiesDescription];
    [aCoder encodeObject:_name forKey:kRecomendationActivitiesName];
    [aCoder encodeObject:_url forKey:kRecomendationActivitiesUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationActivities *copy = [[RecomendationActivities alloc] init];
    
    if (copy) {

        copy.estimatedCost = [self.estimatedCost copyWithZone:zone];
        copy.activitiesIdentifier = [self.activitiesIdentifier copyWithZone:zone];
        copy.urlType = [self.urlType copyWithZone:zone];
        copy.areas = [self.areas copyWithZone:zone];
        copy.activitiesDescription = [self.activitiesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
