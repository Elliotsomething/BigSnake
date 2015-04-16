//
//  myview.h
//  tanchishe
//
//  Created by book mac on 13-7-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface myview : UIView{
    int k,j,l,m ;
    NSArray *arr;
    CGPoint p1;
}
-(void)drawinrect:(CGContextRef)context;
-(void)drawflash:(CGContextRef)context;
-(void)set:(int)a set1:(int)b set2:(int)c set3:(int )d point:(NSMutableArray *)arr1;
@end
