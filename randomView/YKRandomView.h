//
//  YKRandomView.h
//  randomView
//
//  Created by yanguo.sun on 13-4-11.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YKRandomViewDataSource<NSObject>
- (NSArray *)titleArray;
@end
@interface YKRandomView : UIView
@property (nonatomic, retain) id<YKRandomViewDataSource> datasource;
- (id)initWithFrame:(CGRect)frame withDataSource:(id<YKRandomViewDataSource>)datasource_;
- (void)reloadData;
@end
