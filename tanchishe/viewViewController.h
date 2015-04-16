//
//  viewViewController.h
//  tanchishe
//
//  Created by book mac on 13-7-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myview;
@interface viewViewController : UIViewController{
    int i,j,k,l;
    Boolean n1,n2,n3,n4;
    NSMutableArray *arr;
    CGPoint p;
    NSString *str1;
    int m;
}
@property(strong)NSMutableArray *arr;
@property(strong)myview *my;
@end
