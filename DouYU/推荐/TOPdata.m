//
//  TOPdata.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 11/10/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "TOPdata.h"

@implementation TOPdata 
-(id)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){     
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
@end
