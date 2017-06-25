//
//  ViewControllerdfdfdf.m
//  qiandao
//
//  Created by auto on 2017/3/20.
//  Copyright © 2017年 auto. All rights reserved.
//

#import "ViewControllerdfdfdf.h"
#import "CRNavigationBar.h"
#import "HWCalendar.h"



@interface ViewControllerdfdfdf ()< HWCalendarDelegate>
{
    UITableView *_tableView;
}
@property (nonatomic, weak) HWCalendar *calendar;


@end

@implementation ViewControllerdfdfdf
@synthesize person = _person ;
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES] ;
    _person = [Person read] ;
    [self setNavigationbar] ;
   }
- (void)viewDidLoad {
    [super viewDidLoad];
    [self preferredStatusBarStyle] ;
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    _view2.backgroundColor = [UIColor clearColor];
     _view1.backgroundColor = [UIColor whiteColor];
    _view1.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);

    HWCalendar *calendar = [[HWCalendar alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/5, [[UIScreen mainScreen]bounds].size.width, 396)];
    calendar.delegate = self;
    calendar.showTimePicker = YES;
    
    [_view1 addSubview:calendar];
    self.calendar = calendar;
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/5, self.view.frame.size.width, self.view.frame.size.height*4/5)  style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    [_view2 addSubview:_tableView];

    

    // Do any additional setup after loading the view, typically from a nib.
   }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section==0?4:1;
}
//设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str=@"setView";
    
    UITableViewCell * cell=[_tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.section==0) {
            switch (indexPath.row) {
                case 0:
                    cell.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] ;
                    cell.textLabel.text =@"2017-04-12 21:10:13 签到";
                     cell.imageView.image = [UIImage imageNamed:@"cellphoto1"] ;
                    //cell.imageView.image=[UIImage imageNamed:@"test"];
                    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    
                    break;
                case 1:
                    cell.textLabel.text =@"2017-04-12 21:26:12 签出";
                     cell.imageView.image = [UIImage imageNamed:@"cellphoto2"] ;
                    cell.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] ;
                                       break;
                case 2:
                    cell.textLabel.text =@"2017-04-12 21:44:44 签到";
                     cell.imageView.image = [UIImage imageNamed:@"cellphoto1"] ;
                    cell.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] ;
                    break;
                case 3:
                    cell.textLabel.text =@"2017-04-12 21:56:12 签出";
                     cell.imageView.image = [UIImage imageNamed:@"cellphoto2"] ;
                    cell.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] ;
                    break;
                    //                case 4:
                    //                    cell.backgroundColor = [UIColor redColor];
                    //                    cell.textColor = [UIColor whiteColor];
                    //                    cell.textLabel.text =@"                               退出账户";
                    //                    break;
                    
                default:
                    break;
            }
        }else  {
            
            cell.backgroundColor = [UIColor redColor];
            cell.textColor = [UIColor whiteColor];
            cell.textLabel.text =@"我有疑问？";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            
        }
    }
    return cell;
}

//点击日历的单元格,点击确定后发生的事件
- (void)calendar:(HWCalendar *)calendar didClickSureButtonWithDate:(NSString *)date
{
    NSLog(@"%@",[NSString stringWithFormat:date]);
    _view1.backgroundColor = [UIColor clearColor];
}



- (void)setNavigationbar
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CRNavigationBar *navigationBar = [[CRNavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 66)];
    UIColor * colorUnsigned =[UIColor colorWithRed:39/255.0 green:148/255.0 blue:252/255.0 alpha:1] ;
    UIColor * colorSigned = [UIColor colorWithRed:92/255.0 green:200/255.0 blue:151/255.0 alpha:1] ;
    if ([_person.isSigned integerValue] ==1 ) {
        navigationBar.barTintColor = colorSigned ;
    }else{
        navigationBar.barTintColor = colorUnsigned ;
    }

    NSDictionary * colordic = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor] ;


    navigationBar.titleTextAttributes = colordic ;
    //创建UINavigationItem
    UINavigationItem * navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"签到记录"];
    
    [navigationBar pushNavigationItem: navigationBarTitle animated:YES];
    [self.view addSubview: navigationBar];
    UIBarButtonItem *rili = [[UIBarButtonItem alloc]initWithTitle:@"日历" style: nil target:self action:@selector(rilishow)];
    rili.tintColor = [UIColor whiteColor] ;
    navigationBarTitle.rightBarButtonItem = rili;
    
    //    //创建UIBarButton 可根据需要选择适合自己的样式
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(navigationBackButton:)];
    //     item.tintColor = [UIColor blackColor] ;
    //设置barbutton
    //    [navigationBar setItems:[NSArray arrayWithObject: navigationBarTitle]];
    
}
-(void)rilishow{
    
    [_calendar show:_person.isSigned];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
