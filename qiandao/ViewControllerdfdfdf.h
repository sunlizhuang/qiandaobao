//
//  ViewControllerdfdfdf.h
//  qiandao
//
//  Created by auto on 2017/3/20.
//  Copyright © 2017年 auto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface ViewControllerdfdfdf : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@property (nonatomic ,strong) Person * person ;
@end
