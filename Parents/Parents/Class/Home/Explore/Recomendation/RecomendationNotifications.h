//
//  RecomendationNotifications.h
//
//  Created by   on 8/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecomendationNotifications : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *count;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
