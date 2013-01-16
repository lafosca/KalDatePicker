//
//  ViewController.m
//  Kal
//
//  Created by David Cortés on 15/01/13.
//  Copyright (c) 2013 David Cortés. All rights reserved.
//

#import "ViewController.h"

#import "KalLogic.h"
#import "KalDate.h"


@interface ViewController ()

@property (nonatomic, strong) KalView *kalView;
@property (nonatomic, strong) KalLogic *kalLogic;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _kalLogic = [[KalLogic alloc] init];
    
    _kalView = [[KalView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 280) delegate:self logic:self.kalLogic];
    
    [_kalView selectDate:[KalDate dateFromNSDate:[NSDate date]]];
    [self.view addSubview:_kalView];
    
}

- (void)showPreviousMonth
{
    [self.kalLogic retreatToPreviousMonth];
    [self.kalView slideDown];
}

- (void)showFollowingMonth
{
    [self.kalLogic advanceToFollowingMonth];
    [self.kalView slideUp];
}

-(void)didSelectDate:(KalDate *)date
{
    NSDate *data = [date NSDate];
    NSLog(@"%@",data);
    //Aqui tens la data seleccionada
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
