//
//  TOPdata.h
//  DouYU
//
//  Created by Nancy's MacbookPro on 11/10/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOPdata : NSObject
@property(nonatomic,strong)NSString *Id;

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSString *pic_url;

@property(nonatomic,strong)NSString *hls_url;

@property(nonatomic,strong)NSDictionary *room;
@end
