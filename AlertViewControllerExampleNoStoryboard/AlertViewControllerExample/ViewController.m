//
//  ViewController.m
//  AlertViewControllerExample
//
//  Created by Carlos Santiago Cruz on 4/17/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
UIButton *button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat widthButton = 60;
    CGFloat heightButton = 60;
    CGFloat abscissaCenteredButton = self.view.frame.size.width/2 - widthButton/2;
    CGFloat ordinateCenteredButton = self.view.frame.size.height/2 - heightButton/2;

    CGRect buttonFrame = CGRectMake(abscissaCenteredButton,
                                    ordinateCenteredButton,
                                    widthButton,
                                    heightButton);
    button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    // target-action patter explicitly shown.
    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonTapped
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"This is my first alert, be nice"
                                                                   message:@"This is a simple alert"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *oKButton = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:oKButton];
    
    NSMutableAttributedString *attributedStringTitle = [[NSMutableAttributedString alloc]initWithString:@"This is my first alert, be nice"];
    [attributedStringTitle addAttribute:NSForegroundColorAttributeName
                                  value:[UIColor redColor]
                                  range:NSMakeRange(0,[attributedStringTitle length])];
    [attributedStringTitle addAttribute:NSFontAttributeName
                                  value:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]
                                  range:NSMakeRange(0,[attributedStringTitle length])];
    [alert setValue:attributedStringTitle forKey:@"attributedTitle"];
    
    NSMutableAttributedString *attributedStringMessage = [[NSMutableAttributedString alloc]initWithString:@"This is a simple alert"];
    [attributedStringMessage addAttribute:NSForegroundColorAttributeName
                                  value:[UIColor blueColor]
                                  range:NSMakeRange(0,[attributedStringMessage length])];
    [attributedStringMessage addAttribute:NSFontAttributeName
                                  value:[UIFont fontWithName:@"HelveticaNeue-Light" size:20]
                                  range:NSMakeRange(0,[attributedStringMessage length])];
    [alert setValue:attributedStringMessage forKey:@"attributedMessage"];
    
    [self presentViewController:alert animated:YES completion:^{
        sleep(2);
        [self->button setBackgroundColor:[UIColor redColor]];
    }];
}
@end
