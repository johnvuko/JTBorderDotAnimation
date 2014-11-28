//
//  JTBorderDotAnimation.h
//  JTBorderDotAnimation
//
//  Created by Jonathan Tribouharet
//

#import <Foundation/Foundation.h>

@interface JTBorderDotAnimation : NSObject

@property (weak, nonatomic) UIView *animatedView;

@property (assign, nonatomic) NSUInteger numberPoints;
@property (assign, nonatomic) CFTimeInterval duration;
@property (assign, nonatomic) float repeatCount;
@property (assign, nonatomic) CGFloat pointSize;
@property (strong, nonatomic) UIColor *pointColor;

- (void)start;
- (void)stop;

@end
