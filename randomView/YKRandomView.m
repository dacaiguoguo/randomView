//
//  YKRandomView.m
//  randomView
//
//  Created by yanguo.sun on 13-4-11.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKRandomView.h"
float getTextSizeWidth(NSString*text ,float aFontSize) ;
float getTextSizeWidth(NSString*text ,float aFontSize) {
    NSString *platFormstr = text;
    CGSize platFormconstraint = CGSizeMake(10000, 10000);
    CGSize platFormsize =[platFormstr sizeWithFont:[UIFont systemFontOfSize:aFontSize] constrainedToSize:platFormconstraint lineBreakMode: NSLineBreakByCharWrapping ];
    return platFormsize.width;
}
NSArray *stringLengthArrayFor(NSArray* _arr,float aFontSize);
NSArray *stringLengthArrayFor(NSArray* _arr,float aFontSize){
    NSMutableArray *lengthArray = [NSMutableArray array];;
    
    for (int i=0; i<_arr.count; i++) {
        NSString *obj = _arr[i];
        float len = getTextSizeWidth(obj, 14)+10;
        [lengthArray addObject:[NSNumber numberWithFloat:len]];
    }
    return lengthArray;
}

NSArray *lieInfoFor(NSArray* _lengInfo,float maxWidth,float widthAdd);
NSArray *lieInfoFor(NSArray* _lengInfo,float maxWidth,float widthAdd){
    float total = 0;
    NSMutableArray *lie = [NSMutableArray array];
    [lie addObject:[NSNumber numberWithInt:0]];
    int tempTotal = 0;
    for (int i=0; i<_lengInfo.count; i++) {
        NSNumber *num =   _lengInfo[i];
        tempTotal+= (num.floatValue+widthAdd);
        if (tempTotal>maxWidth) {
            /*记下number*/
            [lie addObject:[NSNumber numberWithInt:i]];
            tempTotal = (num.floatValue+widthAdd);
        }
        total  = tempTotal;
    }
    if (total!=0) {
        int lastnumber =  _lengInfo.count;
        [lie addObject:[NSNumber numberWithInt:lastnumber]];
    }
    return lie;
}

NSArray *retRectArrayFor(NSArray* _data,float aFontSize,float maxW,float widthAdd,float hAdd,float buttonH);
NSArray *retRectArrayFor(NSArray* _data,float aFontSize,float maxW,float widthAdd,float hAdd,float buttonH){
    
    NSArray* _lengInfo = stringLengthArrayFor(_data,aFontSize);
    NSArray* _lieInfo = lieInfoFor(_lengInfo, maxW,widthAdd);
    
    int widthadd = widthAdd;
    int hadd = hAdd;
    int buH = buttonH;
    NSMutableArray *cgrectArray = [NSMutableArray array];
    for (int i=0; i<_lieInfo.count-1; i++) {
        NSNumber *obj = _lieInfo[i];
        int chushi = obj.intValue;
        obj = _lieInfo[i+1];
        float dangqianXTotal = 0;
        int end = obj.intValue;
        
        for (int j = chushi; j<end; j++) {
            NSNumber *wwww = _lengInfo[j];
            /*添加button Frame*/
            CGRect fra = CGRectMake(dangqianXTotal+(widthadd*(j-chushi)), hadd*i, wwww.floatValue, buH);
            [cgrectArray addObject:[NSValue valueWithCGRect:fra]];
            dangqianXTotal+=wwww.floatValue;
            
        }
        
    }
    return cgrectArray;
}

@implementation YKRandomView
- (id)initWithFrame:(CGRect)frame withDataSource:(id<YKRandomViewDataSource>)datasource_{
    self = [super initWithFrame:frame];
    if (self) {
        self.datasource = datasource_;
        NSArray *soarray = [self.datasource titleArray];

        NSArray *cgrectArray = retRectArrayFor(soarray, 14, 320, 10, 60, 44);
        for (int k=0; k<cgrectArray.count; k++) {
            UIButton *a = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [a setTitle:soarray[k] forState:UIControlStateNormal];
            NSValue *val = cgrectArray[k];
            a.frame = val.CGRectValue;
            [self addSubview:a];
        }
        // Initialization code
    }
    return self;
}
- (void)reloadData{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray *soarray = [self.datasource titleArray];
    NSArray *cgrectArray = retRectArrayFor(soarray, 14, 320, 10, 60, 44);
    for (int k=0; k<cgrectArray.count; k++) {
        UIButton *a = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [a setTitle:soarray[k] forState:UIControlStateNormal];
        NSValue *val = cgrectArray[k];
        a.frame = val.CGRectValue;
        [self addSubview:a];
    }
}

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
