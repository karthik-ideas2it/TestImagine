//
//  ExploreDataModel.h
//  Parents
//
//  Created by Karthikeyan on 8/28/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExploreDataModel : NSObject
{
    NSMutableArray *arr_Experiences;
    NSMutableArray *arr_Activities;
    NSMutableArray *arr_marketplaces;
    NSMutableArray *arr_Children;
    NSMutableDictionary *dict_children;
    
}

@property (nonatomic, retain) NSMutableArray *arr_Experiences;
@property (nonatomic, retain) NSMutableArray *arr_Activities;
@property (nonatomic, retain) NSMutableArray *arr_marketplaces;
@property (nonatomic, retain) NSMutableArray *arr_Children;
@property (nonatomic, retain) NSMutableDictionary *dict_children;


+(id)SharedExploredata;

@end
