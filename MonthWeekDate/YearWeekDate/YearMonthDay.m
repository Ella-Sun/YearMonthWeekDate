//
//  YearMonthDay.m
//  SampleCode
//
//  Created by sunhong on 2016/10/26.
//  Copyright © 2016年 sunhong. All rights reserved.
//

#import "YearMonthDay.h"

@implementation YearMonthDay

/**
 日期格式化

 @param date 日期格式

 @return 对应的string格式
 */
- (NSString *)formateWithDate:(NSDate *)date{
    
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    formate.dateFormat = @"yyyy-MM-dd";
    return [formate stringFromDate:date];
}


/**
 获取包含时分秒的NSDateComponents
 */
- (NSDateComponents *)dayDateComponents {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[[NSDate alloc] init]];
    [components setHour:-components.hour];
    [components setMinute:-components.minute];
    [components setSecond:-components.second];
    
    return components;
}

/**
 获取包含年月日的NSDateComponents
 */
- (NSDateComponents *)weekDateCompontents {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:[[NSDate alloc] init]];
    
    return components;
}

/**
 今天
 */
- (NSDate *)dateToday {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [self dayDateComponents];
    
    //the start of today (midnight)
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    return today;
}


/**
 周一
 */
- (NSDate *)dateThisWeek {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [self weekDateCompontents];
    
    // week:2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六) 1(星期天)
    NSInteger weekDay = components.weekday - 1;
    //几号
    NSInteger day = components.day;
    // 计算当前日期和这周的星期一和星期天差的天数
    NSInteger firstDiff,lastDiff;
    if (weekDay == 0) {
        firstDiff = -6;
        lastDiff = 0;
    } else {
        firstDiff = cal.firstWeekday - weekDay;
        lastDiff = 7 - weekDay;
    }
    
    NSDateComponents *firstDayComp = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [firstDayComp setDay:(day+firstDiff)];
    NSDate *firstDayOfWeek= [cal dateFromComponents:firstDayComp];
    
    return firstDayOfWeek;
}

/**
 周日
 */
- (NSDate *)endDateThisWeek {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [self weekDateCompontents];
    
    // week:2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六) 1(星期天)
    NSInteger weekDay = components.weekday - 1;
    //几号
    NSInteger day = components.day;
    // 计算当前日期和这周的星期一和星期天差的天数
    NSInteger firstDiff,lastDiff;
    if (weekDay == 0) {
        firstDiff = -6;
        lastDiff = 0;
    } else {
        firstDiff = cal.firstWeekday - weekDay;
        lastDiff = 7 - weekDay;
    }
    
    NSDateComponents *lastDayComp = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek= [cal dateFromComponents:lastDayComp];
    
    return lastDayOfWeek;
}

/**
 本月开始日期
 */
- (NSDate *)dateThisMonth {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitMonth fromDate:[[NSDate alloc] init]];
    
    NSDate *startOfMonth = [cal dateFromComponents:components];
    
    return startOfMonth;
}

/**
 本月结束日期
 */
- (NSDate *)endDateThisMonth {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitMonth fromDate:[[NSDate alloc] init]];
    
    [components setMonth:components.month + 1];
    [components setDay:(components.day - components.day)];
    NSDate *endOfMonth = [cal dateFromComponents:components];
    
    return endOfMonth;
}


/**
 上个月开始日期
 */
- (NSDate *)dateLastMonth {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitMonth fromDate:[[NSDate alloc] init]];
    
    [components setDay:(components.day - components.day + 1)];
    [components setMonth:components.month -1];
    NSDate *startOfLastMonth = [cal dateFromComponents:components];
    
    return startOfLastMonth;
}

/**
 上个月结束日期
 */
- (NSDate *)endDateLastMonth {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitMonth fromDate:[[NSDate alloc] init]];
    
    [components setDay:(components.day - components.day)];
    NSDate *endOfLastMonth = [cal dateFromComponents:components];
    
    return endOfLastMonth;
}


/**
 今年第一天
 */
- (NSDate *)dateThisYear {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitYear fromDate:[[NSDate alloc] init]];
    
    NSDate *startOfThisYear = [cal dateFromComponents:components];
    
    return startOfThisYear;
}

/**
 今年最后一天
 */
- (NSDate *)endDateThisYear {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitYear fromDate:[[NSDate alloc] init]];
    
    [components setYear:(components.year + 1)];
    [components setSecond:(components.second - 1)];
    NSDate *endOfThisYear = [cal dateFromComponents:components];
    
    return endOfThisYear;
}

#pragma mark - 外部方法

/**
 今天的上一年
 
 @return 去年今天
 */
- (NSDate *)dateLastYear
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSCalendarUnitYear |NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    
    [components setYear:(components.year - 1)];
    [components setMonth:(components.month - 6)];
    
    NSDate *endOfThisYear = [cal dateFromComponents:components];
    
    return endOfThisYear;
}

- (NSString *)dateStrLastYear
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSString *lastDateStr = [dateFormatter stringFromDate:[self dateLastYear]];
    return lastDateStr;
}

- (NSDictionary *)today {
    
    NSDate *today = [self dateToday];
    
    NSString *start = @"", *end = @"";
    start = [self formateWithDate:today];
    
    NSDictionary *dateDic = @{@"start":start,
                @"end":end};
    return dateDic;
}

- (NSDictionary *)thisWeek {
    
    NSDate *firstDayOfWeek = [self dateThisWeek];
    NSDate *lastDayOfWeek = [self endDateThisWeek];
    
    NSString *start = @"", *end = @"";
    start = [self formateWithDate:firstDayOfWeek];
    end = [self formateWithDate:lastDayOfWeek];
    
    NSDictionary *dateDic = @{@"start":start,
                              @"end":end};
    return dateDic;
}

- (NSDictionary *)lastWeek {
    
    NSString *start = @"", *end = @"";
    
    NSDictionary *dateDic = @{@"start":start,
                              @"end":end};
    return dateDic;
}

- (NSDictionary *)thisMonth {
    
    NSDate *startOfMonth = [self dateThisMonth];
    NSDate *endOfMonth = [self endDateThisMonth];
    
    NSString *start = @"", *end = @"";
    start = [self formateWithDate:startOfMonth];
    end = [self formateWithDate:endOfMonth];
    
    NSDictionary *dateDic = @{@"start":start,
                              @"end":end};
    return dateDic;
}

- (NSDictionary *)lastMonth {
    
    NSDate *startOfLastMonth = [self dateLastMonth];
    NSDate *endOfLastMonth = [self endDateLastMonth];
    
    NSString *start = @"", *end = @"";
    start = [self formateWithDate:startOfLastMonth];
    end = [self formateWithDate:endOfLastMonth];
    
    NSDictionary *dateDic = @{@"start":start,
                              @"end":end};
    return dateDic;
}

- (NSDictionary *)thisYear {
    
    NSDate *startOfYear = [self dateThisYear];
    NSDate *endOfYear = [self endDateThisYear];
    
    NSString *start = @"", *end = @"";
    start = [self formateWithDate:startOfYear];
    end = [self formateWithDate:endOfYear];
    
    NSDictionary *dateDic = @{@"start":start,
                              @"end":end};
    return dateDic;
}

@end
