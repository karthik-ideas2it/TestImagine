//
//  ExploreDataModel.m
//  Parents
//
//  Created by Karthikeyan on 8/28/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ExploreDataModel.h"

@implementation ExploreDataModel
@synthesize arr_Activities,arr_Experiences,arr_marketplaces,arr_Children;
@synthesize dict_children;
+(id)SharedExploredata{
    
    static ExploreDataModel *sharedData=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedData = [[self alloc] init];
    });
    
    return sharedData;
    
}

- (id)init {
    
    if (self = [super init]) {
        arr_marketplaces=[NSMutableArray array];
        arr_Experiences = [NSMutableArray array];
        arr_Activities  = [NSMutableArray array];
        arr_Children = [NSMutableArray array];
    }
    
    return self;
}
@end
