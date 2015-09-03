//
//  RecomendationDiscover.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 Ideas2IT. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecomendationDiscover : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *discoverIdentifier;
@property (nonatomic, strong) NSString *urlType;
@property (nonatomic, strong) NSString *publishDate;
@property (nonatomic, strong) NSString *discoverDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
