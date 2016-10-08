//
//  ColumnModel.h
//  DouYU
//
//  Created by Nancy's MacbookPro on 30/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumnModel : NSObject
@property(nonatomic,strong)NSString *cate_id;

@property(nonatomic,strong)NSString *game_name;

@property(nonatomic,strong)NSString *short_name;

@property(nonatomic,strong)NSString *game_url;

@property(nonatomic,strong)NSString *game_src;

@property(nonatomic,strong)NSString *game_icon;

@property(nonatomic,strong)NSString *online_room;

@property(nonatomic,strong)NSString *online_room_ios;

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
