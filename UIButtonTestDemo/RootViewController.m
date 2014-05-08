//
//  RootViewController.m
//  UIButtonTestDemo
//
//  Created by mac on 14-5-7.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#define BUTTON_TAG 200
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    
    
    self.title = @"root";
    self.view.backgroundColor = [UIColor greenColor];
    for (int i = 0; i < 5; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setFrame:CGRectMake(100, 100+60*i, 100, 50)];
        [button setTitle:[NSString stringWithFormat:@"下一步，\n请点击这里 %d",i] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.numberOfLines = 2;
        button.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        
        [button setBackgroundColor:[UIColor magentaColor]];
        [button setTag:BUTTON_TAG +i];
        //显示圆角
        button.clipsToBounds = YES;
        button.layer.cornerRadius = 5;
        //加边框线
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}

-(void)buttonClicked:(UIButton *)btn {
    NSLog(@"btn.tag = %d",btn.tag);
    CATransition *mCATAnimation = [CATransition animation];
    [mCATAnimation setType:@"pageCurl"];
    
    [mCATAnimation setSubtype:kCATransitionFromLeft];
    [mCATAnimation setDuration:1.5];
    
    switch (btn.tag-BUTTON_TAG) {
        case 0:
        {
            [mCATAnimation setType:@"suckEffect"];
            [self.navigationController.view.layer addAnimation:mCATAnimation forKey:nil];
            
            SecondViewController *svc = [[SecondViewController alloc] init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 1:
        {
            [mCATAnimation setType:@"rippleEffect"];
            [self.navigationController.view.layer addAnimation:mCATAnimation forKey:nil];
            
            ThirdViewController *svc = [[ThirdViewController alloc] init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 2:
        {
            [mCATAnimation setType:@"oglFlip"];
            [self.navigationController.view.layer addAnimation:mCATAnimation forKey:nil];
            
            FourthViewController *svc = [[FourthViewController alloc] init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 3:
        {
            [mCATAnimation setType:@"reveal"];
            [self.navigationController.view.layer addAnimation:mCATAnimation forKey:nil];
            
            FifthViewController *svc = [[FifthViewController alloc] init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
            
        default:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"warning" message:@"Please select first four" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO",@"Other", nil];
            [alert show];
            
        }
            break;
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [alertView show];
    NSLog(@"buttonIndex:%d",buttonIndex);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
