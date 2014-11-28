//
//  JTBorderDotAnimation.m
//  JTBorderDotAnimation
//
//  Created by Jonathan Tribouharet
//

#import "JTBorderDotAnimation.h"

@interface JTBorderDotAnimation(){
    NSMutableArray *pointsViews;
}

@end

@implementation JTBorderDotAnimation

- (id)init
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    self.numberPoints = 2;
    
    self.duration = 5.;
    self.repeatCount = HUGE_VALF;
    
    self.pointSize = 4.;
    self.pointColor = [UIColor blueColor];
    
    pointsViews = [NSMutableArray new];
}

- (void)start
{
    if(!self.animatedView){
        NSLog(@"JTBorderDotAnimation no view to animate");
        return;
    }
 
    [self stop];
    
    self.animatedView.clipsToBounds = NO;
    
    CFTimeInterval offset = self.duration / (float)self.numberPoints;
    
    for(NSUInteger i = 0; i < self.numberPoints; ++i){
        UIView *pointView = [self createPointView];
        [pointsViews addObject:pointView];
        
        [self.animatedView addSubview:pointView];
        
        CAKeyframeAnimation *animation = [self createAnimation];
        animation.timeOffset = offset * i;
        [pointView.layer addAnimation:animation forKey:@"JTBorderDotAnimation"];
    }
}

- (void)stop
{
    for(UIView *pointview in pointsViews){
        [pointview removeFromSuperview];
    }
    [pointsViews removeAllObjects];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)finished
{
    if(finished){
        [self stop];
    }
}

- (UIView *)createPointView
{
    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.pointSize, self.pointSize)];
    pointView.layer.cornerRadius = self.pointSize / 2.;
    pointView.backgroundColor = self.pointColor;
    
    return pointView;
}

- (CAKeyframeAnimation *)createAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.duration = self.duration;
    animation.calculationMode = kCAAnimationPaced;
    animation.repeatCount = self.repeatCount;
    animation.delegate = self;
    
    CGFloat animatedWidth = CGRectGetWidth(self.animatedView.frame);
    CGFloat animatedHeight = CGRectGetHeight(self.animatedView.frame);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL , 0, 0);
    CGPathAddLineToPoint(path, NULL, animatedWidth, 0);
    CGPathAddLineToPoint(path, NULL, animatedWidth, animatedHeight);
    CGPathAddLineToPoint(path, NULL, 0, animatedHeight);
    CGPathAddLineToPoint(path, NULL, 0, 0);
    
    animation.path = path;
    CGPathRelease(path);
    
    return animation;
}

@end
