//
//  YKViewController.m
//  randomView
//
//  Created by yanguo.sun on 13-4-9.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKViewController.h"
#import "YKRandomView.h"
float getTextSizeWidth(NSString*text ,float aFontSize) ;


@interface YKViewController ()<YKRandomViewDataSource>
@property (nonatomic, strong) YKRandomView *random;
@end

@implementation YKViewController
- (NSArray *)titleArray{
    NSString *s = @"123456789";
    NSMutableArray *data = [NSMutableArray array];;
    for (int i=0; i<10; i++) {
        int randLength = abs(rand())%(s.length-3)+3;
        assert(randLength>2);
        [data addObject:[s substringToIndex:randLength]];
    }
    return data;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.random = [[YKRandomView alloc] initWithFrame:CGRectMake(0, 0, 320, 300) withDataSource:self];
    [self.view addSubview:_random];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changRandomView:(id)sender {
    [_random reloadData];
}
@end
