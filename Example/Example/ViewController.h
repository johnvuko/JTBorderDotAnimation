//
//  ViewController.h
//  Example
//
//  Created by Jonathan Tribouharet.
//

#import <UIKit/UIKit.h>

#import "JTBorderDotAnimation.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *animatedView1;
@property (strong, nonatomic) JTBorderDotAnimation *dotAnimation1;

@property (weak, nonatomic) IBOutlet UIButton *animatedView2;
@property (strong, nonatomic) JTBorderDotAnimation *dotAnimation2;

@end

