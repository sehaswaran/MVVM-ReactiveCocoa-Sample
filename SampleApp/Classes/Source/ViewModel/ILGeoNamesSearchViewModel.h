//
//  ILGeoNamesSearchViewModel.h
//  SampleApp
//
//  Created by Sehaswaran Mayilerum on 28/01/15.
//  Copyright (c) 2015 Infinite Loop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILGeoNamesSearchViewModel : NSObject
@property(nonatomic,strong) NSString *searchBarPrompt;
@property(nonatomic,strong) NSMutableArray *searchResults;

@end
