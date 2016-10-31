//
//  LW_HomeTableViewController.m
//  LW_ShoppingAPP
//
//  Created by wei on 2016/6/6.
//  Copyright © 2016年 LWSpro. All rights reserved.
//

#import "LW_HomeTableViewController.h"
#import "LW_WebViewController.h"
#import "CategoryHeader.h"
#import "DefineHeader.h"
#import "GlobalCGFloatHeader.h"
/**  轮播图片的第三方 */
#import "SDCycleScrollView.h"

static CGFloat const navHAndStatusH = 64;

@interface LW_HomeTableViewController ()<SDCycleScrollViewDelegate>

/**  属性: 轮播图片上的文字 */
@property (nonatomic,strong) NSArray *titles;


@end

@implementation LW_HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-navHAndStatusH, 0, 0, 0);
    
    self.tableView.tableHeaderView = [self SDCycleScrollView];
    
//    [self.tableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>]
}



- (UIView *)SDCycleScrollView {
    
    CGFloat cycleScrollViewH = 180 + navHAndStatusH;
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, UIScreenWidth , cycleScrollViewH) delegate:self placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //图片上加有文字
    cycleScrollView.titlesGroup = self.titles;
    // 自定义分页控件小圆标颜色
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    
    return cycleScrollView;
    
    
}




#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"LW_WebViewController") new] animated:YES];
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
    
    return cell;
}





@end
