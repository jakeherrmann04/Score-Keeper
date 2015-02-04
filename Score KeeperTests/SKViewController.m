//
//  SKViewController.m
//  Score Keeper
//
//  Created by Jake Herrmann on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

static CGFloat margin = 15;
static CGFloat topMargin = 40;



@interface SKViewController ()


@property (nonatomic, strong)UIScrollView *_scrollView;
@property (nonatomic, strong)NSMutableArray *_scoreLabels;
@end

@implementation SKViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    self._scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    self.title = @"Score Keeper";
    
    
    
    self._scoreLabels = [NSMutableArray new];
    
    for (int i = 0; i<4; i++) {
        [self addScoreView:i];
    }
    
    
    
}

-(void)addScoreView:(NSInteger) index{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, topMargin*index+20, self.view.frame.size.width, 30)];
    UITextField *name = [[UITextField alloc]initWithFrame:CGRectMake(margin, 0, self.view.frame.size.width / 3, 20)];
    name.placeholder = @"Name";
    [view addSubview:name];
    
    UILabel *score = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width / 3) , 0, self.view.frame.size.width / 3, 20)];
    score.text = @"0";
    [self._scoreLabels addObject:score];
    [view addSubview:score];
   
    UIStepper *pointChanger = [[UIStepper alloc]initWithFrame:CGRectMake(((self.view.frame.size.width / 3) * 2) - margin, 0, self.view.frame.size.width / 3, 20)];
    pointChanger.tag = index;
    pointChanger.maximumValue = 1000;
    pointChanger.minimumValue = -1000;
    [view addSubview:pointChanger];
    
    [pointChanger addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self._scrollView addSubview:view];
    
   
}

-(void)stepperChanged:(id)sender {
    
    UIStepper *stepper = sender;
    
    NSInteger stepperTag = stepper.tag;
    
    double value = [stepper value];
    
    UILabel *score = self._scoreLabels[stepperTag];
    score.text = [NSString stringWithFormat:@"%d",(int)value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
