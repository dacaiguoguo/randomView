//
//  YKRandomView.m
//  randomView
//
//  Created by yanguo.sun on 13-4-11.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKRandomView.h"
float getTextSizeWidth(NSString*text ,float aFontSize) ;

@implementation YKRandomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *data = nil;
        NSMutableArray *lengthArray = nil;
        
        for (int i=0; i<data.count; i++) {
            NSString *obj =     data[i];
            float len = getTextSizeWidth(obj, 14);
            [lengthArray addObject:[NSNumber numberWithFloat:len]];
        }
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

@end
