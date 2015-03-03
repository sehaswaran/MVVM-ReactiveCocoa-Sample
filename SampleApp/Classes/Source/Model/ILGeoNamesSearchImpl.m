//
//  ILGeoNamesSearchImpl.m
//  SampleApp
//
//  Created by Sehaswaran Mayilerum on 05/02/15.
//  Copyright (c) 2015 Infinite Loop. All rights reserved.
//

#import "ILGeoNamesSearchImpl.h"
#import "ILGeoNamesLookup.h"
@interface ILGeoNamesSearchImpl()<ILGeoNamesLookupDelegate>
@property(nonatomic,strong) NSMutableSet *requests;
//@property(nonatomic,strong) ILGeoNamesLookup *geoNameSearch;
@property(nonatomic,weak) id<ILGeoNamesViewModelServices> services;
@end
@implementation ILGeoNamesSearchImpl
-(instancetype)initWithServices:(id<ILGeoNamesViewModelServices>)services{
    self =[ super init];
    if(self){
        _services = services;
    }
    return self;
}
-(RACSignal*)getILGeoNamesSearchSignal:(NSString *)searchString{
    return [self signalFromApiMethod:searchString transform:^id(NSDictionary *response) {
        return nil;
    }];
}
-(RACSignal*)signalFromApiMethod:(NSString*)searchString transform:(id(^)(NSDictionary* response))block{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        ILGeoNamesLookup *geoNameSearch = [[ILGeoNamesLookup alloc]initWithUserID:@"sehaswaran"];
        geoNameSearch.delegate = self;
        [self.requests addObject:geoNameSearch];
        
        RACSignal *successSignal = [self rac_signalForSelector:@selector(geoNamesLookup:didFindGeoNames:totalFound:) fromProtocol:@protocol(ILGeoNamesLookupDelegate)];
        
        @weakify(geoNameSearch)
        [[[[successSignal filter:^BOOL(RACTuple *tuple) {
            @strongify(geoNameSearch);
            return tuple.first == geoNameSearch;
        }]
         map:^id(RACTuple *tuple) {
             return tuple.second;
         }]
         map:block]
         subscribeNext:^(id x) {
             [subscriber sendNext:x];
             [subscriber sendCompleted];
         }];
        return [RACDisposable disposableWithBlock:^{
            [self.requests removeObject:geoNameSearch];
        }];
    }];
    
}
@end
