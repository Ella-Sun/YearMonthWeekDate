//
//  YearMonthDay.h
//  SampleCode
//
//  Created by sunhong on 2016/10/26.
//  Copyright © 2016年 sunhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YearMonthDay : NSObject


/**
 今天
 */
- (NSDictionary *)today;
/**
 本周
 */
- (NSDictionary *)thisWeek;
/**
 上周
 */
- (NSDictionary *)lastWeek;
/**
 本月
 */
- (NSDictionary *)thisMonth;
/**
 上个月
 */
- (NSDictionary *)lastMonth;

/**
 本年
 */
- (NSDictionary *)thisYear;

@end
