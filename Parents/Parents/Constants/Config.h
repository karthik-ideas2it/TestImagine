//
//  Config.h
//  Parents
//
//  Created by Karthikeyan on 8/31/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#ifndef Parents_Config_h
#define Parents_Config_h

#define APP_NAME NSLocalizedString(@"Parents", @"App Name")

#define ServerURL @"http://192.168.0.36:8080/RESTServices"
#define Recomend_API @"/recommendations"

#define ExploreMenu     NSLocalizedString(@"Explore",   @"Explore menu Name")
#define CommunityMenu   NSLocalizedString(@"Community", @"Community menu Name")
#define DashboardMenu   NSLocalizedString(@"Dashboard", @"Dashboard menu Name")
#define MessageMenu     NSLocalizedString(@"Message",   @"Message menu Name")
#define ShopMenu        NSLocalizedString(@"Shop",      @"Shop menu Name")

#define TabBarItems @[ExploreMenu,CommunityMenu,DashboardMenu,MessageMenu,ShopMenu]

#endif
