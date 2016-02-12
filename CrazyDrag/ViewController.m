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
- (IBAction)StartOver:(id)sender;

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

-(void)startNewGame{
    score=0;
    round=0;
    [self startNewRound];
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
- (IBAction)StartOver:(id)sender {
    [self startNewGame];
    [self updateLabels];}

- (IBAction)showAlert:(id)sender {
    int difference=abs(currentValue-targetValue);
    int points=100-difference;
    NSString *title;
    if(difference==0){
        title=@"土豪你太牛逼了！";
        points+=100;
    }
    else if(difference<5){
            title=@"土豪太棒了，差一点";
       if (difference==1){
           points+=50;
        }
        }else if(difference<10){
                title=@"好吧勉强算个土豪！";
            }else{
                title=@"不是土豪少来装！";
            }
    score+=points;
    
    NSString *message =[NSString stringWithFormat:@"恭喜高富帅，您的得分是 %d\n",points];
    [[[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"朕已知晓，爱卿辛苦了" otherButtonTitles:nil, nil]show];
       round++;

    
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self startNewRound];
    [self updateLabels];
}
    
@end
