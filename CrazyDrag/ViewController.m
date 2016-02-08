//
//  ViewController.m
//  CrazyDrag
//
//  Created by Nizc on 16/2/4.
//  Copyright © 2016年 Ni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int targetValue;
    int currentValue;
    int score;
    int round;
    
}
- (IBAction)sliderMoved:(UISlider*)sender;

- (IBAction)showAlert:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;
@end

@implementation ViewController
@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;
-(void)updateLabels{
    self.targetLabel.text=[NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text=[NSString stringWithFormat:@"%d",score];
    self.roundLabel.text=[NSString stringWithFormat:@"%d",round];

}
-(void)startNewRound{
    //round+=1;
    targetValue=(1+arc4random()%100);
    currentValue=50;
    self.slider.value=currentValue;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider*)sender {
        //NSLog(@"滑动条的当前数量值是: %f",slider.value);
    currentValue = (int)lroundf(slider.value);
}

- (IBAction)showAlert:(id)sender {
    int difference=abs(currentValue-targetValue);
    int points=100-difference;
    score+=points;
    
    NSString *message =[NSString stringWithFormat:@"您的选择是：%d\n靠近值为：%d\n得分是 ： %d\n",currentValue,difference,points];
    [[[UIAlertView alloc]initWithTitle:@"最终成绩 " message:message delegate:nil cancelButtonTitle:@"once more" otherButtonTitles:nil, nil]show];
    round++;
    [self startNewRound];
    [self updateLabels];
    
}

@end
