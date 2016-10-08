//
//  CollectionViewCell.h
//  DouYU
//
//  Created by Nancy's MacbookPro on 30/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnModel.h"

@interface CollectionViewCell : UICollectionViewCell
-(void)setContentWith:(ColumnModel *)model;
@end
