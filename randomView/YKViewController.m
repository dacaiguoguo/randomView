//
//  YKViewController.m
//  randomView
//
//  Created by yanguo.sun on 13-4-9.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKViewController.h"
float getTextSizeWidth(NSString*text ,float aFontSize) ;
float getTextSizeWidth(NSString*text ,float aFontSize) {
    NSString *platFormstr = text;
    CGSize platFormconstraint = CGSizeMake(10000, 10000);
    CGSize platFormsize =[platFormstr sizeWithFont:[UIFont systemFontOfSize:aFontSize] constrainedToSize:platFormconstraint lineBreakMode: NSLineBreakByCharWrapping ];
    return platFormsize.width;
}
NSArray *stringLengthArrayFor(NSArray* _arr);
NSArray *stringLengthArrayFor(NSArray* _arr){
    NSMutableArray *lengthArray = [NSMutableArray array];;
    
    for (int i=0; i<_arr.count; i++) {
        NSString *obj = _arr[i];
        float len = getTextSizeWidth(obj, 14)+10;
        [lengthArray addObject:[NSNumber numberWithFloat:len]];
    }
    return _arr;
}

NSArray *lieInfoFor(NSArray* _lengInfo,float maxWidth);
NSArray *lieInfoFor(NSArray* _lengInfo,float maxWidth){
    float total = 0;
    NSMutableArray *lie = [NSMutableArray array];
    [lie addObject:[NSNumber numberWithInt:0]];
    int tempTotal = 0;
    for (int i=0; i<_lengInfo.count; i++) {
        NSNumber *num =   _lengInfo[i];
        tempTotal+= num.floatValue;
        if (tempTotal>maxWidth) {
            /*记下number*/
            [lie addObject:[NSNumber numberWithInt:i]];
            tempTotal = num.floatValue;
        }
        total  = tempTotal;
    }
    if (total!=0) {
        int lastnumber =  _lengInfo.count;
        [lie addObject:[NSNumber numberWithInt:lastnumber]];
    }
    return lie;
}
NSArray *retRectArrayFor(NSArray* _lieInfo,NSArray* _lengInfo,float widthAdd,float hAdd,float buttonH){

    int widthadd = widthAdd;
    int hadd = hAdd;
    int buH = buttonH;
    NSMutableArray *cgrectArray = [NSMutableArray array];
    for (int i=0; i<_lieInfo.count-1; i++) {
        NSNumber *obj = _lieInfo[i];
        int chushi = obj.intValue;
        obj = _lieInfo[i+1];
        int end = obj.intValue;
        
        for (int j = chushi; j<end; j++) {
            NSNumber *wwww = _lengInfo[j];
            
            /*添加button Frame*/
            CGRect fra = CGRectMake((j-chushi)*widthadd, hadd*i, wwww.floatValue, buH);
            [cgrectArray addObject:[NSValue valueWithCGRect:fra]];
        }
    }
    return cgrectArray;
}


@interface YKViewController ()

@end

@implementation YKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *s = @"sfdjfsfdjf";
    NSLog(@"%0.2f",getTextSizeWidth(s , 14));
    
    
    NSMutableArray *data = [NSMutableArray array];;
    for (int i=0; i<10; i++) {
        [data addObject:s];
    }
    NSLog(@"%@",data);
    NSMutableArray *lengthArray = [NSMutableArray array];;
    
    for (int i=0; i<data.count; i++) {
        NSString *obj =     data[i];
        float len = getTextSizeWidth(obj, 14)+10;
        [lengthArray addObject:[NSNumber numberWithFloat:len]];
    }
    
    float total = 0;
    NSMutableArray *lie = [NSMutableArray array];
    [lie addObject:[NSNumber numberWithInt:0]];
    int tempTotal = 0;
    for (int i=0; i<lengthArray.count; i++) {
        NSNumber *num =   lengthArray[i];
        tempTotal+= num.floatValue;
        if (tempTotal>320) {
            /*记下number*/
            [lie addObject:[NSNumber numberWithInt:i]];
            tempTotal = num.floatValue;
        }
        total  = tempTotal;
    }
    if (total!=0) {
        int lastnumber =  data.count;
        [lie addObject:[NSNumber numberWithInt:lastnumber]];
    }

    int widthadd = 64;
    int hadd = 80;
    int buH = 44;
    NSMutableArray *cgrectArray = [NSMutableArray array];
    for (int i=0; i<lie.count-1; i++) {
        NSNumber *obj = lie[i];
        int chushi = obj.intValue;
        obj = lie[i+1];
        int end = obj.intValue;
        
        for (int j = chushi; j<end; j++) {
            NSNumber *wwww = lengthArray[j];
            
            /*添加button*/
            CGRect fra = CGRectMake((j-chushi)*widthadd, hadd*i, wwww.floatValue, buH);
            [cgrectArray addObject:[NSValue valueWithCGRect:fra]];
        }
//        hadd*=i;
    }
    NSLog(@"cgr:%@",cgrectArray);
    for (int k=0; k<cgrectArray.count; k++) {
        UIButton *a = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [a setTitle:data[k] forState:UIControlStateNormal];
        NSValue *val = cgrectArray[k];
        a.frame = val.CGRectValue;
        [self.view addSubview:a];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
