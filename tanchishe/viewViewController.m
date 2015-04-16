//
//  viewViewController.m
//  tanchishe
//
//  Created by book mac on 13-7-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "viewViewController.h"
#import "myview.h"

@implementation viewViewController
@synthesize arr;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    arr=[[NSMutableArray alloc]init];
    p.x=0,p.y=0;
    str1=NSStringFromCGPoint(p);
    [arr addObject:str1];
//     产生随机数,坐标点是由37*29=1073组成
    m = arc4random() % 1073;
//    计算随机数产生的坐标点（k,l）
    k=(m%29+1)*10;l=(m/29+1)*10;

//    xib与画布关联起来
    self.my = [[myview alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:self.my];
    [self.my setBackgroundColor:[UIColor clearColor]];
    [super viewDidLoad];
    // 定义定时器 选择间隔时间1秒，重复调用                         
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    j=10;i=100;n1=n2=n3=n4=NO;
//    定义添加手势
    UISwipeGestureRecognizer *swp1=nil;swp1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handswp:)];
    [swp1 setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.my addGestureRecognizer:swp1];
    swp1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handswp:)];
    [swp1 setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.my addGestureRecognizer:swp1];
    swp1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handswp:)];
    [swp1 setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.my addGestureRecognizer:swp1];
    swp1=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handswp:)];
    [swp1 setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.my addGestureRecognizer:swp1];
    
	// Do any additional setup after loading the view, typically from a nib.
}
//定时器绑定的方法
-(void)timerFired:(NSTimer *)timer{
    if (n1) {
        j=j+10;
    }
    if (n2) {
        i=i-10;
    }
    if (n3) {
        i=i+10;
    }
    if (n4) {
        j=j-10;
    }
    NSLog(@"%d",j);
    p.x=i;p.y=j;
    
   NSString *str=NSStringFromCGPoint(p);
    
//    判断是否吃到食物，吃到就蛇尾数组加一，更新随机数
    if (i==(m%29+1)*10&&j==(m/29+1)*10) {
        NSLog(@"%d",m);
        [arr addObject:str];
        m = arc4random() % 1073;
        k=(m%29+1)*10;l=(m/29+1)*10;
    }
    
    
//    蛇头坐标更新，即在数组第一个插入最新的蛇头坐标
    [arr insertObject:str atIndex:0];
//    蛇尾坐标更新，即在数组最后一个删掉一个坐标
    [arr removeObjectAtIndex:[arr count]-1];
    
//    调用myview的方法，传蛇头的坐标过去，还有蛇尾数组
    [self.my set:i set1:j set2:k set3:l point:arr];
//    判断是否撞墙
    if (i<10||i>310||j<10||j>380) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"游戏结束" message:nil delegate:nil cancelButtonTitle:@"重新开始" otherButtonTitles: nil];
        [alert show];
        [timer setFireDate:[NSDate distantFuture]];// 临时停止，开启 distantpast
        //[timer invalidate];//  永远停止
    }
    
    CGPoint h;
    for (int o=1; o<[arr count]; o++) {
        h=CGPointFromString([arr objectAtIndex:o]);
        if (p.x==h.x&&p.y==h.y) {
            NSLog(@"nihaoooooo");

            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"游戏结束" message:nil delegate:nil cancelButtonTitle:@"重新开始" otherButtonTitles: nil];
            [alert show];
            [timer setFireDate:[NSDate distantFuture]];// 临时停止，开启 distantpast
            //[timer invalidate];//  永远停止

        }
    }
    //    调用刷新

        [self.my setNeedsDisplay];
    
}

//手势绑定的方法
-(void)handswp:(UISwipeGestureRecognizer *)gestur{
    if (gestur.direction==UISwipeGestureRecognizerDirectionDown) {
        n1=YES;n2=n3=n4=NO;
        NSLog(@"nihao");
    }
    if (gestur.direction==UISwipeGestureRecognizerDirectionLeft) {
        n2=YES;n1=n3=n4=NO;
        NSLog(@"nihao1");
    }
    if (gestur.direction==UISwipeGestureRecognizerDirectionRight) {
        n3=YES;n1=n2=n4=NO;
        NSLog(@"nihao2");
    }
    if (gestur.direction==UISwipeGestureRecognizerDirectionUp) {
        n4=YES;n1=n2=n3=NO;
        NSLog(@"nihao3");
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
