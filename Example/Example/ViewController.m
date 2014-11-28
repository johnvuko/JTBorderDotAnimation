//
//  ViewController.m
//  Example
//
//  Created by Jonathan Tribouharet.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dotAnimation1 = [JTBorderDotAnimation new];
    self.dotAnimation1.animatedView = self.animatedView1;
    
    self.animatedView2.layer.borderWidth = 1.;
    self.animatedView2.layer.borderColor = [UIColor orangeColor].CGColor;
    
    self.dotAnimation2 = [JTBorderDotAnimation new];
    self.dotAnimation2.animatedView = self.animatedView2;
    self.dotAnimation2.numberPoints = 5.;
    self.dotAnimation2.pointColor = [UIColor orangeColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.dotAnimation1 start];
    [self.dotAnimation2 start];
}

@end
