//
//  myview.m
//  tanchishe
//
//  Created by book mac on 13-7-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "myview.h"

@implementation myview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)drawinrect:(CGContextRef)context{
    
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    for (int i=0; i<400; i=i+10) {
        CGRect re=CGRectMake(0, i, 9, 9);
        CGContextAddRect(context, re);

    }
    for (int i=0; i<400; i=i+10) {
        CGRect re=CGRectMake(310, i, 9, 9);
        CGContextAddRect(context, re);
    }
    for (int i=10; i<310; i=i+10) {
        CGRect re=CGRectMake(i, 0, 9, 9);
        CGContextAddRect(context, re);
    }
    for (int i=10; i<310; i=i+10) {
        CGRect re=CGRectMake(i, 390, 9, 9);
        CGContextAddRect(context, re);
        
    }
    CGRect re=CGRectMake(l, m, 9, 9);
    CGContextAddRect(context, re);
    //填充颜色
    CGContextFillPath(context);
    //CGContextStrokePath(context);
    
}
-(void)drawflash:(CGContextRef)context{
    
        CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
//    画蛇头
            CGRect re1=CGRectMake(j, k, 9, 9);
            CGContextAddRect(context, re1);
//    画蛇尾
    for (int i=0; i<[arr count]; i++) {
        p1=CGPointFromString([arr objectAtIndex:i]);
        CGRect re2=CGRectMake(p1.x, p1.y, 9, 9);
        CGContextAddRect(context, re2);
    }
   
        CGContextFillPath(context);
    
}
//传坐标和数组过来
-(void)set:(int)a set1:(int)b set2:(int)c set3:(int)d point:(NSMutableArray *)arr1{
    j=a,k=b;
    l=c,m=d;
    arr=[NSArray arrayWithArray:arr1];
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context=UIGraphicsGetCurrentContext();
    [self drawinrect:context];
    [self drawflash:context];
}
@end
