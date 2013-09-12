//
//  ViewController.h
//  BoterKaasEieren
//
//  Created by Furkan on 9/11/13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //NSArray * vakjes;
    //NSString * stringArray[3][3];
    Boolean gewonnen;
    Boolean gelijkspel;
    int aantalZetten;
    NSMutableArray * vakjesLijst;
    UIButton * btnPlay;
    UIButton * btn1;
    UIButton * btn2;
    UIButton * btn3;
    UIButton * btn4;
    UIButton * btn5;
    UIButton * btn6;
    UIButton * btn7;
    UIButton * btn8;
    UIButton * btn9;
}
@property(nonatomic, assign)int aantalZetten;
@property(nonatomic, assign)Boolean gelijkspel;
@property(nonatomic, retain)IBOutlet UIButton * btnPlay;
@property(nonatomic, assign)Boolean  gewonnen;
@property(nonatomic, retain)IBOutlet UIButton * btn1;
@property(nonatomic, retain)IBOutlet UIButton * btn2;
@property(nonatomic, retain)IBOutlet UIButton * btn3;
@property(nonatomic, retain)IBOutlet UIButton * btn4;
@property(nonatomic, retain)IBOutlet UIButton * btn5;
@property(nonatomic, retain)IBOutlet UIButton * btn6;
@property(nonatomic, retain)IBOutlet UIButton * btn7;
@property(nonatomic, retain)IBOutlet UIButton * btn8;
@property(nonatomic, retain)IBOutlet UIButton * btn9;
-(IBAction)init:(id)sender;
-(IBAction)setMark: (id)sender;
-(void)setMark2;
-(Boolean)checkIfWon:(NSString*)playerType;
-(IBAction)setRandomMark:(id)sender;	
-(void) vulVakje:(int)nummer :(NSString*)inhoud;
-(NSString*) getVakje:(int)nummer;
-(void) slimmeZet;
@end
