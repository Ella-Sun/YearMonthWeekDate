//
//  ViewController.m
//  MonthWeekDate
//
//  Created by sunhong on 2016/10/26.
//  Copyright © 2016年 sunhong. All rights reserved.
//

#import "ViewController.h"

#import "YearMonthDay.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel * dateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat viewWidth = self.view.bounds.size.width * 0.7;;
    CGFloat viewHeight = self.view.bounds.size.height * 0.7;
    CGRect labelFrame = CGRectMake(0, 0, viewWidth, viewHeight);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.center = self.view.center;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    self.dateLabel = label;
    
    [self testDate];
}

- (void)testDate {
    
    YearMonthDay *day = [[YearMonthDay alloc] init];
    NSDictionary *todayDic = [day today];
    NSDictionary *thisWeek = [day thisWeek];
    NSDictionary *thisMonth = [day thisMonth];
    NSDictionary *lastMonth = [day lastMonth];
    NSDictionary *thisYear = [day thisYear];
    
//    NSLog(@"\ntoday:%@\n*****",todayDic[@"start"]);
//    NSLog(@"\nthisWeek:%@\n*****%@\n*****",thisWeek[@"start"],thisWeek[@"end"]);
//    NSLog(@"\nthisMonth:%@\n*****%@\n*****",thisMonth[@"start"],thisMonth[@"end"]);
//    NSLog(@"\nlastMonth:%@\n*****%@\n*****",lastMonth[@"start"],lastMonth[@"end"]);
    
    NSString *todayStr = [NSString stringWithFormat:@"today:\n%@\n*****",todayDic[@"start"]];
    NSString *thisWeekStr = [NSString stringWithFormat:@"thisWeek:\n%@\n%@\n*****",thisWeek[@"start"],thisWeek[@"end"]];
    NSString *thisMonthStr = [NSString stringWithFormat:@"thisMonth:\n%@\n%@\n*****",thisMonth[@"start"],thisMonth[@"end"]];
    NSString *lastMonthStr = [NSString stringWithFormat:@"lastMonth:\n%@\n%@\n*****",lastMonth[@"start"],lastMonth[@"end"]];
    NSString *thisYearStr = [NSString stringWithFormat:@"thisYear:\n%@\n%@\n*****",thisYear[@"start"],thisYear[@"end"]];
    
    NSString *dateText = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n",todayStr,thisWeekStr,thisMonthStr,lastMonthStr,thisYearStr];
    self.dateLabel.text = dateText;
}


@end
