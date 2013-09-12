//
//  ViewController.m
//  BoterKaasEieren
//
//  Created by Furkan on 9/11/13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize gelijkspel;
@synthesize aantalZetten;
@synthesize btnPlay;
@synthesize gewonnen;
@synthesize btn1;
@synthesize btn2;
@synthesize btn3;
@synthesize btn4;
@synthesize btn5;
@synthesize btn6;
@synthesize btn7;
@synthesize btn8;
@synthesize btn9;

-(IBAction)init:(id)sender
{
    if(!gewonnen && !gelijkspel)
    {
        vakjesLijst = [[NSMutableArray alloc]init];
        [vakjesLijst addObject:btn1];
        [vakjesLijst addObject:btn2];
        [vakjesLijst addObject:btn3];
        [vakjesLijst addObject:btn4];
        [vakjesLijst addObject:btn5];
        [vakjesLijst addObject:btn6];
        [vakjesLijst addObject:btn7];
        [vakjesLijst addObject:btn8];
        [vakjesLijst addObject:btn9];
    }else{
        for(int i =0; i<[vakjesLijst count]; i++)
        {
            [[vakjesLijst objectAtIndex:i] setTitle:nil forState:(UIControlStateNormal)];
        }
        gewonnen = false;
        gelijkspel = false;
        aantalZetten = 0;
    }
}

-(IBAction)setMark:(id)sender
{
    if(!gewonnen && !gelijkspel)
    {
        if([sender currentTitle] == nil)
        {
            [sender setTitle:@"X" forState:(UIControlStateNormal)];
            aantalZetten++;
            if([self checkIfWon: @"X"])
            {
                return;
            }
            [self setMark2];
        }
    }
}

-(void)setMark2
{
    int r = random() % 9;
    //NSLog(@"%@", [[vakjesLijst objectAtIndex:r] curentTitle]);
    while([[vakjesLijst objectAtIndex:r] currentTitle] != nil)
    {
        r = random() % 9;
    }
    [[vakjesLijst objectAtIndex:r] setTitle:@"O" forState:(UIControlStateNormal)];
    aantalZetten++;
    [self checkIfWon:@"O"];
}


-(Boolean)checkIfWon:(NSString*)playerType
{
    int hoeveelheidGemarkeerdeVakjes = 0;
    if(aantalZetten >8)
    {
        NSLog(@"Gelijkspel");
        [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
        gelijkspel = true;
        return true;
    }
    if(([[vakjesLijst objectAtIndex:0] currentTitle] == playerType && [[vakjesLijst objectAtIndex:4] currentTitle] == playerType & [[vakjesLijst objectAtIndex:8] currentTitle] == playerType) || ([[vakjesLijst objectAtIndex:2] currentTitle] == playerType && [[vakjesLijst objectAtIndex:4] currentTitle] == playerType && [[vakjesLijst objectAtIndex:6] currentTitle] == playerType))
    {
        NSLog(@"Hoera speler %@ heeft gewonnen", playerType);
        [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
        gewonnen = true;
        return true;
    }
    for(int i = 0; i<3; i++)
    {
        NSLog(@"1");
        for(int ii = i; ii<9; ii =ii+3)
        {
            NSLog(@"2");
            if([[vakjesLijst objectAtIndex:ii] currentTitle] == playerType)
            {
                hoeveelheidGemarkeerdeVakjes++;
            }
        }
        if(hoeveelheidGemarkeerdeVakjes == 3)
        {
            NSLog(@"Hoera speler %@ heeft gewonnen", playerType);
            [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
            gewonnen = true;
            return true;
        }
        hoeveelheidGemarkeerdeVakjes = 0;
    }
    
    for(int i = 0; i<9; i=i+3)
    {
        NSLog(@"3");
        for(int ii = i; ii<i+3; ii++)
        {
            NSLog(@"4");
            if([[vakjesLijst objectAtIndex:ii] currentTitle] == playerType)
            {
                hoeveelheidGemarkeerdeVakjes++;
            }
        }
        if(hoeveelheidGemarkeerdeVakjes == 3)
        {
            [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
            NSLog(@"Hoera speler %@ heeft gewonnen", playerType);
            gewonnen = true;
            return true;
        }
        hoeveelheidGemarkeerdeVakjes = 0;
    }
    return false;
}

-(IBAction)setRandomMark:(id)sender
{

        //[sender setTitle:@"X" forState:(UIControlStateNormal)];
        //[(PointPtr)stringArray[2][0] setTitle:@"X" forState:(UIControlStateNormal)];
    //[[vakjesLijst objectAtIndex:2] setTitle:@"X" forState:(UIControlStateNormal)];
    //NSLog(@"%@", [vakjesLijst objectAtIndex:2]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
