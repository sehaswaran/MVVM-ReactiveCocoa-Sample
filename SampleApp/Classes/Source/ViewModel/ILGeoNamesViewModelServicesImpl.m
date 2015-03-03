//
//  ILGeoNamesViewModelServicesImpl.m
//  SampleApp
//
//  Created by Sehaswaran Mayilerum on 21/02/15.
//  Copyright (c) 2015 Infinite Loop. All rights reserved.
//

#import "ILGeoNamesViewModelServicesImpl.h"
#import "ILGeoNamesSearchImpl.h"
@interface ILGeoNamesViewModelServicesImpl()
@property(nonatomic,strong) ILGeoNamesSearchImpl *searchImpl;
@end
@implementation ILGeoNamesViewModelServicesImpl
-(instancetype)init{
    self =[super init];
    if(self){
        _searchImpl =[ILGeoNamesSearchImpl new];
    }
    return self;
}
-(id<ILGeoNamesSearch>)getSearchService{
    return self.searchImpl;
}
@end
