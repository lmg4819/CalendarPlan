//
//  CPExerciseViewController.m
//  CalendarPlan
//
//  Created by lmg on 2018/7/17.
//  Copyright © 2018年 lmg. All rights reserved.
//

#import "CPExerciseViewController.h"
#import <PNChart.h>

@interface CPExerciseViewController ()<PNChartDelegate>

@end

@implementation CPExerciseViewController
/*
 NSArray *items = @[[PNPieChartDataItem dataItemWithValue:30 color:PNBrown description:@"cat"],[PNPieChartDataItem dataItemWithValue:20 color:PNDarkBlue description:@"pig"], [PNPieChartDataItem dataItemWithValue:50 color:PNGrey description:@"dog"]];
 
 PNPieChart *pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(100, 100, 200, 200) items:items];
 
 pieChart.delegate = self;
 [pieChart strokeChart];
 // 加到父视图上
 [self.view addSubview:pieChart];
 
 // 显示图例
 pieChart.hasLegend = YES;
 // 横向显示
 pieChart.legendStyle = PNLegendItemStyleSerial;
 // 显示位置
 pieChart.legendPosition = PNLegendPositionTop;
 // 获得图例 当横向排布不下另起一行
 UIView *legend = [pieChart getLegendWithMaxWidth:100];
 legend.frame = CGRectMake(100, 300, legend.bounds.size.width, legend.bounds.size.height);
 [self.view addSubview:legend];
 */
- (void)layoutPieChart
{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:30 color:PNBrown description:@"cat"],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNDarkBlue description:@"pig"],
                       [PNPieChartDataItem dataItemWithValue:50 color:PNRed description:@"dog"]];
    PNPieChart *pieChart = [[PNPieChart alloc]initWithFrame:CGRectMake(100, 100, 200, 200) items:items];
    
    pieChart.delegate = self;
    [pieChart strokeChart];
    // 加到父视图上
    [self.view addSubview:pieChart];
    // 显示图例
    pieChart.hasLegend = YES;
    // 横向显示
    pieChart.legendPosition = PNLegendPositionTop;
    // 获得图例 当横向排布不下另起一行
    UIView *legend = [pieChart getLegendWithMaxWidth:100];
    legend.frame = CGRectMake(100, 300, legend.bounds.size.width, legend.bounds.size.height);
    [self.view addSubview:legend];
    
}
- (void)layoutCycleChart
{
    PNCircleChart *circleChart = [[PNCircleChart alloc]initWithFrame:CGRectMake(100, NavBarHeight+50, 200, 200) total:@100 current:@10 clockwise:YES shadow:YES shadowColor:[UIColor grayColor] displayCountingLabel:YES overrideLineWidth:@15];
    
    circleChart.chartType = PNChartFormatTypePercent;
    circleChart.strokeColor = [UIColor greenColor];
    
    [circleChart strokeChart];
    
    [self.view addSubview:circleChart];
}
- (void)layoutBarChart
{
    PNBarChart *barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 150, LSWIDTH, 300)];
    barChart.backgroundColor = [UIColor yellowColor];
    //Y坐标label宽度(微调)
    barChart.yChartLabelWidth = 20.0;

    barChart.chartMarginLeft = 30.0;
    barChart.chartMarginRight = 10.0;
    barChart.chartMarginTop = 5.0;
    barChart.chartMarginBottom = 10.0;
    //X坐标刻度的上边距
    barChart.labelMarginTop = 2.0;
    //是否显示坐标轴
    barChart.showChartBorder = YES;
    [barChart setXLabels:@[@"魅族",@"华为",@"中兴",@"小米",@"苹果",@"乐视"]];
    [barChart setYValues:@[@20,@8,@5,@33,@16,@8]];
    //每个柱子的颜色
    [barChart setStrokeColors:@[PNGreen,PNRed,PNRed,PNRed,PNRed,PNRed]];

    //是否立体效果
    barChart.isGradientShow = NO;

    //显示各条状图的数值
    barChart.isShowNumbers = YES;

    //开始绘图
    [barChart strokeChart];

    barChart.delegate = self;
    [self.view addSubview:barChart];
}
- (void)layoutLineChart
{
    PNLineChart *lineChart = [[PNLineChart alloc]initWithFrame:CGRectMake(0, NavBarHeight+64, LSWIDTH, 200.0)];
    lineChart.delegate = self;
    lineChart.showLabel = YES;
    //是否显示曲线图
    lineChart.showSmoothLines = NO;
    //是否显示坐标轴
    lineChart.showCoordinateAxis = YES;
    //是否显示Y轴的数值
    lineChart.showGenYLabels = YES;
    //是否显示横向虚线
    lineChart.showYGridLines = YES;
    //坐标轴的宽度
    lineChart.axisWidth = 1;
    //坐标轴的颜色
    lineChart.axisColor = [UIColor blueColor];
    //y坐标轴的字体颜色
    lineChart.yLabelColor = [UIColor blackColor];
    //x坐标轴的字体颜色
    lineChart.xLabelColor = [UIColor blackColor];
    //x坐标轴的文字
    [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    
    //line chart NO.1
    NSArray *dats01Array = @[@60.1,@160.1,@126.4,@262.2,@186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    //折线的颜色
    data01.color = PNFreshGreen;
    //折点的个数
    data01.itemCount = lineChart.xLabels.count;
    //折线的数据源
    data01.getData = ^PNLineChartDataItem *(NSUInteger item) {
        CGFloat yValue = [dats01Array[item] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    //line chart NO.2
    NSArray *data02Array = @[@20.1,@180.1,@26.4,@202.2,@126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    //折线的颜色
    data02.color = PNTwitterColor;
    //折点的样式
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    //折点的大小
    data02.inflexionPointWidth = 3.0f;
    //折点的文本颜色
    data02.pointLabelColor = [UIColor redColor];
    //折点的文本字体
    data02.pointLabelFont = [UIFont systemFontOfSize:12];
    //是否展示折点的label
    data02.showPointLabel = YES;
    //折线的个数
    data02.itemCount = lineChart.xLabels.count;
    //折线的数据源
    data02.getData = ^PNLineChartDataItem *(NSUInteger item) {
        CGFloat yValue = [data02Array[item] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    lineChart.chartData = @[data01,data02];
    //开始绘制折线图
    [lineChart strokeChart];
    //将折线图添加到视图上
    [self.view addSubview:lineChart];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"健康";
    [self layoutPieChart];
}

#pragma Mark -PNLineChartDelegate
-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex
{
   // CPLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}
-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex
{
    CPLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}
#pragma Mark -PNBarChartDelegate
-(void)userClickedOnBarAtIndex:(NSInteger)barIndex
{
    CPLog(@"--------%ld--------",(long)barIndex);
}

#pragma Mark -PNPieChartDelegate
-(void)userClickedOnPieIndexItem:(NSInteger)pieIndex
{
    CPLog(@"==========%ld=========",(long)pieIndex);
}
-(void)didUnselectPieItem
{
    
}
@end
