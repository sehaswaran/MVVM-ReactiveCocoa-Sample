//
//  ILGeoNameSearchTableViewCell.m
//  SampleApp
//
//  Created by Sehaswaran Mayilerum on 20/02/15.
//  Copyright (c) 2015 Infinite Loop. All rights reserved.
//

#import "ILGeoNameSearchTableViewCell.h"
#import "ILGeoNamesSearchResultViewModel.h"
@interface ILGeoNameSearchTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *textLabelCustom;
@property (weak, nonatomic) IBOutlet UILabel *detailTextLabelCustom;

@end
@implementation ILGeoNameSearchTableViewCell

-(void)bindViewModel:(id)viewModel{
    NSLog(@"ILGeoNameSearchTableViewCell bindViewModel");
    ILGeoNamesSearchResultViewModel *resultSearchviewModel = viewModel;
    self.textLabelCustom.text = resultSearchviewModel.textLabelName;
    self.detailTextLabelCustom.text = resultSearchviewModel.detailTextLabelSubstring;
}
@end
