//
//  ILGeoNamesSearchImpl.h
//  SampleApp
//
//  Created by Sehaswaran Mayilerum on 05/02/15.
//  Copyright (c) 2015 Infinite Loop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILGeoNamesSearch.h"
#import "ILGeoNamesViewModelServices.h"
@interface ILGeoNamesSearchImpl : NSObject<ILGeoNamesSearch>
-(instancetype)initWithServices:(id<ILGeoNamesViewModelServices>)services;
@end
