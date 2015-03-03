//
//  ILGeoNamesSearchViewModel.m
//  SampleApp
//
//  Created by Sehaswaran Mayilerum on 28/01/15.
//  Copyright (c) 2015 Infinite Loop. All rights reserved.
//

#import "ILGeoNamesSearchViewModel.h"

@implementation ILGeoNamesSearchViewModel
-(instancetype)init{
    self = [super init];
    if(self){
        
        [self initalize];
    }
    return self;
}
-(void)initalize{
    self.searchBarPrompt =  NSLocalizedStringFromTable(@"ILGEONAMES_SEARCH_PROMPT", @"ILGeoNames", @"");
    self.searchResults = [NSMutableArray new];

}
- (RACSignal *)signalFromAPIMethod:(NSString *)method
                         arguments:(NSDictionary *)args
                         transform:(id (^)(NSDictionary *response))block {
    
    // 1. Create a signal for this request
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // 2. Create a Flick request object
        
        // 3. Create a signal from the delegate method
        RACSignal *successSignal ;
    //self rac_signalForSelector:@selector(flickrAPIRequest:didCompleteWithResponse:)
                       //fromProtocol:@protocol(OFFlickrAPIRequestDelegate)];
        
        // 4. Handle the response
        [[[successSignal
           map:^id(RACTuple *tuple) {
               return tuple.second;
           }]
          map:block]
         subscribeNext:^(id x) {
             [subscriber sendNext:x];
             [subscriber sendCompleted];
         } error:^(NSError *error) {
             NSLog(@"%@",error);
         }];
        
        // 5. Make the request
       // [flickrRequest callAPIMethodWithGET:method
                                 // arguments:args];
        
        // 6. When we are done, remove the reference to this request
        return [RACDisposable disposableWithBlock:^{
           // [self.requests removeObject:flickrRequest];
        }];
    }];
}
@end
