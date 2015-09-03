//
//  RecomendationDiscover.m
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import "RecomendationDiscover.h"


NSString *const kRecomendationDiscoverAuthor = @"author";
NSString *const kRecomendationDiscoverId = @"id";
NSString *const kRecomendationDiscoverUrlType = @"url_type";
NSString *const kRecomendationDiscoverPublishDate = @"publish_date";
NSString *const kRecomendationDiscoverDescription = @"description";
NSString *const kRecomendationDiscoverName = @"name";
NSString *const kRecomendationDiscoverUrl = @"url";


@interface RecomendationDiscover ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecomendationDiscover

@synthesize author = _author;
@synthesize discoverIdentifier = _discoverIdentifier;
@synthesize urlType = _urlType;
@synthesize publishDate = _publishDate;
@synthesize discoverDescription = _discoverDescription;
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
            self.author = [self objectOrNilForKey:kRecomendationDiscoverAuthor fromDictionary:dict];
            self.discoverIdentifier = [self objectOrNilForKey:kRecomendationDiscoverId fromDictionary:dict];
            self.urlType = [self objectOrNilForKey:kRecomendationDiscoverUrlType fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kRecomendationDiscoverPublishDate fromDictionary:dict];
            self.discoverDescription = [self objectOrNilForKey:kRecomendationDiscoverDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kRecomendationDiscoverName fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRecomendationDiscoverUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.author forKey:kRecomendationDiscoverAuthor];
    [mutableDict setValue:self.discoverIdentifier forKey:kRecomendationDiscoverId];
    [mutableDict setValue:self.urlType forKey:kRecomendationDiscoverUrlType];
    [mutableDict setValue:self.publishDate forKey:kRecomendationDiscoverPublishDate];
    [mutableDict setValue:self.discoverDescription forKey:kRecomendationDiscoverDescription];
    [mutableDict setValue:self.name forKey:kRecomendationDiscoverName];
    [mutableDict setValue:self.url forKey:kRecomendationDiscoverUrl];

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

    self.author = [aDecoder decodeObjectForKey:kRecomendationDiscoverAuthor];
    self.discoverIdentifier = [aDecoder decodeObjectForKey:kRecomendationDiscoverId];
    self.urlType = [aDecoder decodeObjectForKey:kRecomendationDiscoverUrlType];
    self.publishDate = [aDecoder decodeObjectForKey:kRecomendationDiscoverPublishDate];
    self.discoverDescription = [aDecoder decodeObjectForKey:kRecomendationDiscoverDescription];
    self.name = [aDecoder decodeObjectForKey:kRecomendationDiscoverName];
    self.url = [aDecoder decodeObjectForKey:kRecomendationDiscoverUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_author forKey:kRecomendationDiscoverAuthor];
    [aCoder encodeObject:_discoverIdentifier forKey:kRecomendationDiscoverId];
    [aCoder encodeObject:_urlType forKey:kRecomendationDiscoverUrlType];
    [aCoder encodeObject:_publishDate forKey:kRecomendationDiscoverPublishDate];
    [aCoder encodeObject:_discoverDescription forKey:kRecomendationDiscoverDescription];
    [aCoder encodeObject:_name forKey:kRecomendationDiscoverName];
    [aCoder encodeObject:_url forKey:kRecomendationDiscoverUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecomendationDiscover *copy = [[RecomendationDiscover alloc] init];
    
    if (copy) {

        copy.author = [self.author copyWithZone:zone];
        copy.discoverIdentifier = [self.discoverIdentifier copyWithZone:zone];
        copy.urlType = [self.urlType copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
        copy.discoverDescription = [self.discoverDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
