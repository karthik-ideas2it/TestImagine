//
//  RecomendationExperiences.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import "RecomendationExperiences.h"


NSString *const kRecomendationExperiencesCost = @"cost";
NSString *const kRecomendationExperiencesId = @"id";
NSString *const kRecomendationExperiencesUrlType = @"url_type";
NSString *const kRecomendationExperiencesAreas = @"areas";
NSString *const kRecomendationExperiencesDescription = @"description";
NSString *const kRecomendationExperiencesName = @"name";
NSString *const kRecomendationExperiencesUrl = @"url";


@interface RecomendationExperiences ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationExperiences

@synthesize cost = _cost;
@synthesize experiencesIdentifier = _experiencesIdentifier;
@synthesize urlType = _urlType;
@synthesize areas = _areas;
@synthesize experiencesDescription = _experiencesDescription;
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
            self.cost = [self objectOrNilForKey:kRecomendationExperiencesCost fromDictionary:dict];
            self.experiencesIdentifier = [self objectOrNilForKey:kRecomendationExperiencesId fromDictionary:dict];
            self.urlType = [self objectOrNilForKey:kRecomendationExperiencesUrlType fromDictionary:dict];
            self.areas = [self objectOrNilForKey:kRecomendationExperiencesAreas fromDictionary:dict];
            self.experiencesDescription = [self objectOrNilForKey:kRecomendationExperiencesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRecomendationExperiencesName fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRecomendationExperiencesUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cost forKey:kRecomendationExperiencesCost];
    [mutableDict setValue:self.experiencesIdentifier forKey:kRecomendationExperiencesId];
    [mutableDict setValue:self.urlType forKey:kRecomendationExperiencesUrlType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAreas] forKey:kRecomendationExperiencesAreas];
    [mutableDict setValue:self.experiencesDescription forKey:kRecomendationExperiencesDescription];
    [mutableDict setValue:self.name forKey:kRecomendationExperiencesName];
    [mutableDict setValue:self.url forKey:kRecomendationExperiencesUrl];

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

    self.cost = [aDecoder decodeObjectForKey:kRecomendationExperiencesCost];
    self.experiencesIdentifier = [aDecoder decodeObjectForKey:kRecomendationExperiencesId];
    self.urlType = [aDecoder decodeObjectForKey:kRecomendationExperiencesUrlType];
    self.areas = [aDecoder decodeObjectForKey:kRecomendationExperiencesAreas];
    self.experiencesDescription = [aDecoder decodeObjectForKey:kRecomendationExperiencesDescription];
    self.name = [aDecoder decodeObjectForKey:kRecomendationExperiencesName];
    self.url = [aDecoder decodeObjectForKey:kRecomendationExperiencesUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cost forKey:kRecomendationExperiencesCost];
    [aCoder encodeObject:_experiencesIdentifier forKey:kRecomendationExperiencesId];
    [aCoder encodeObject:_urlType forKey:kRecomendationExperiencesUrlType];
    [aCoder encodeObject:_areas forKey:kRecomendationExperiencesAreas];
    [aCoder encodeObject:_experiencesDescription forKey:kRecomendationExperiencesDescription];
    [aCoder encodeObject:_name forKey:kRecomendationExperiencesName];
    [aCoder encodeObject:_url forKey:kRecomendationExperiencesUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationExperiences *copy = [[RecomendationExperiences alloc] init];
    
    if (copy) {

        copy.cost = [self.cost copyWithZone:zone];
        copy.experiencesIdentifier = [self.experiencesIdentifier copyWithZone:zone];
        copy.urlType = [self.urlType copyWithZone:zone];
        copy.areas = [self.areas copyWithZone:zone];
        copy.experiencesDescription = [self.experiencesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
