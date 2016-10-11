//
//  NSString+Times.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 11/10/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "NSString+Times.h"

@implementation NSString (Times)
+(NSString *)GetNowTimes{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    return timeString;
}
@end
