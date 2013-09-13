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
@synthesize label;
@synthesize beatable;

-(IBAction)init:(id)sender
{
    NSLog(@"Woot init!");
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
        label.text = @"Speler aan zet.";
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
            [self slimmeZet];
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
}

-(void) vulVakje:(int)nummer :(NSString *)inhoud {
    NSLog(@"Vakje %i: %@", nummer, inhoud);
    [[vakjesLijst objectAtIndex:nummer] setTitle:inhoud forState:(UIControlStateNormal)];
}

-(NSString*)getVakje:(int)nummer {
    return [[vakjesLijst objectAtIndex:nummer] currentTitle];
}

-(void)slimmeZet{
    NSLog(@"Slimme zet begin");
    
    BOOL beatme = NO;
    if([beatable selectedSegmentIndex] != 0) {
        beatme = YES;
    }
    //check voor een horizontale zet waarmee de cpu wint
    //rij 1
    if([self getVakje:0] == nil &&  [[self getVakje:1] isEqual: @"O"] && [[self getVakje:2] isEqual: @"O"])
    {
        [self vulVakje: 0: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [self getVakje:1] == nil && [[self getVakje:2] isEqual: @"O"])
    {
        [self vulVakje: 1: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [[self getVakje:1] isEqual: @"O"] && [self getVakje:2] == nil)
    {
        [self vulVakje: 2: @"O"];
    }
    //rij 2
    else if([self getVakje:3] == nil &&  [[self getVakje:4] isEqual: @"O"] && [[self getVakje:5] isEqual: @"O"])
    {
        [self vulVakje: 3: @"O"];
    } else if([[self getVakje:3] isEqual: @"O"] &&  [self getVakje:4] == nil && [[self getVakje:5] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if([[self getVakje:3] isEqual: @"O"] &&  [[self getVakje:4] isEqual: @"O"] && [self getVakje:5] == nil)
    {
        [self vulVakje: 5: @"O"];
    }
    //rij 3
    else if([self getVakje:6] == nil &&  [[self getVakje:7] isEqual: @"O"] && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 6: @"O"];
    } else if([[self getVakje:6] isEqual: @"O"] &&  [self getVakje:7] == nil && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 7: @"O"];
    } else if([[self getVakje:6] isEqual: @"O"] &&  [[self getVakje:7] isEqual: @"O"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een verticale zet waarmee de cpu wint
    //rij 1
    else if([self getVakje:0] == nil &&  [[self getVakje:3] isEqual: @"O"] && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 0: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [self getVakje:3] == nil && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 3: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [[self getVakje:3] isEqual: @"O"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    //rij 2
    else if([self getVakje:1] == nil &&  [[self getVakje:4] isEqual: @"O"] && [[self getVakje:7] isEqual: @"O"])
    {
        [self vulVakje: 1: @"O"];
    } else if([[self getVakje:1] isEqual: @"O"] &&  [self getVakje:4] == nil && [[self getVakje:7] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if([[self getVakje:1] isEqual: @"O"] &&  [[self getVakje:4] isEqual: @"O"] && [self getVakje:7] == nil)
    {
        [self vulVakje: 7: @"O"];
    }
    //rij 3
    else if([self getVakje:2] == nil &&  [[self getVakje:5] isEqual: @"O"] && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 2: @"O"];
    } else if([[self getVakje:2] isEqual: @"O"] &&  [self getVakje:5] == nil && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 5: @"O"];
    } else if([[self getVakje:2] isEqual: @"O"] &&  [[self getVakje:5] isEqual: @"O"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een / zet waarmee de cpu wint
    else if ([self getVakje:2] == nil && [[self getVakje:4] isEqual: @"O"] && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 2: @"O"];
    } else if ([[self getVakje:2] isEqual: @"O"] && [self getVakje:4] == nil && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:2] isEqual: @"O"] && [[self getVakje:4] isEqual: @"O"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    //check voor een \ zet waarmee de cpu wint
    else if ([self getVakje:0] == nil && [[self getVakje:4] isEqual: @"O"] && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"O"] && [self getVakje:4] == nil && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:0] isEqual: @"O"] && [[self getVakje:4] isEqual: @"O"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een horizontale zet waarmee speler zou winnen, en blokkeer die zet
    //rij 1
    else if ([self getVakje:0] == nil && [[self getVakje:1] isEqual: @"X"] && [[self getVakje:2] isEqual: @"X"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [self getVakje:1] == nil && [[self getVakje:2] isEqual: @"X"])
    {
        [self vulVakje: 1: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [[self getVakje:1] isEqual: @"X"] && [self getVakje:2] == nil)
    {
        [self vulVakje: 2: @"O"];
    }
    //rij 2
    else if ([self getVakje:3] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:5] isEqual: @"X"])
    {
        [self vulVakje: 3: @"O"];
    } else if ([[self getVakje:3] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:5] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:3] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:5] == nil)
    {
        [self vulVakje: 5: @"O"];
    }
    //rij 3
    else if ([self getVakje:6] == nil && [[self getVakje:7] isEqual: @"X"] && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 6: @"O"];
    } else if ([[self getVakje:6] isEqual: @"X"] && [self getVakje:7] == nil && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 7: @"O"];
    } else if ([[self getVakje:6] isEqual: @"X"] && [[self getVakje:7] isEqual: @"X"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een verticale zet waarmee speler zou winnen, en blokkeer die zet
    //rij 1
    else if ([self getVakje:0] == nil && [[self getVakje:3] isEqual: @"X"] && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [self getVakje:3] == nil && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 3: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [[self getVakje:3] isEqual: @"X"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    //rij 2
    else if ([self getVakje:1] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:7] isEqual: @"X"])
    {
        [self vulVakje: 1: @"O"];
    } else if ([[self getVakje:1] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:7] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:1] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:7] == nil)
    {
        [self vulVakje: 7: @"O"];
    }
    //rij 3
    else if ([self getVakje:2] == nil && [[self getVakje:5] isEqual: @"X"] && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 2: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [self getVakje:5] == nil && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 5: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [[self getVakje:5] isEqual: @"X"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    
    //check voor een / zet waarmee speler zou winnen, en blokkeer die zet
    else if ([self getVakje:2] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 2: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    
    //check voor een \ zet waarmee speler zou winnen, en blokkeer die zet
    else if ([self getVakje:0] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    
    //probeer het midden te vullen
    else if(beatme && [self getVakje:4] == nil) {
        [self vulVakje:4 :@"O"];
    }
    //probeer een hoek te vullen
    else if(beatme && [self getVakje:0] == nil) {
        [self vulVakje:0 :@"O"];
    } else if(beatme && [self getVakje:2] == nil) {
        [self vulVakje:2 :@"O"];
    } else if(beatme && [self getVakje:6] == nil) {
        [self vulVakje:6 :@"O"];
    } else if(beatme && [self getVakje:8] == nil) {
        [self vulVakje:8 :@"O"];
    }
    //geen slimme zet, random
    else {
        NSLog(@"Slimme zet niet gelukt, random nu!");
        [self setMark2];
    }
    aantalZetten++;
    [self checkIfWon:@"O"];
}


-(Boolean)checkIfWon:(NSString*)playerType
{
    int hoeveelheidGemarkeerdeVakjes = 0;
    if(aantalZetten >8)
    {
        [label setText:@"Gelijkspel!"];
        NSLog(@"Gelijkspel");
        [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
        gelijkspel = true;
        return true;
    }
    if(([[vakjesLijst objectAtIndex:0] currentTitle] == playerType && [[vakjesLijst objectAtIndex:4] currentTitle] == playerType & [[vakjesLijst objectAtIndex:8] currentTitle] == playerType) || ([[vakjesLijst objectAtIndex:2] currentTitle] == playerType && [[vakjesLijst objectAtIndex:4] currentTitle] == playerType && [[vakjesLijst objectAtIndex:6] currentTitle] == playerType))
    {
        NSString *temp = [[NSString alloc] initWithFormat:@"Hoera speler %@ heeft gewonnen", playerType];
        [label setText:temp];
        [temp release];
        NSLog(@"Hoera speler %@ heeft gewonnen", playerType);
        [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
        gewonnen = true;
        return true;
    }
    for(int i = 0; i<3; i++)
    {
        //NSLog(@"1");
        for(int ii = i; ii<9; ii =ii+3)
        {
            //NSLog(@"2");
            if([[vakjesLijst objectAtIndex:ii] currentTitle] == playerType)
            {
                hoeveelheidGemarkeerdeVakjes++;
            }
        }
        if(hoeveelheidGemarkeerdeVakjes == 3)
        {
            NSString *temp = [[NSString alloc] initWithFormat:@"Hoera speler %@ heeft gewonnen", playerType];
            [label setText:temp];
            [temp release];
            NSLog(@"Hoera speler %@ heeft gewonnen", playerType);
            [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
            gewonnen = true;
            return true;
        }
        hoeveelheidGemarkeerdeVakjes = 0;
    }
    
    for(int i = 0; i<9; i=i+3)
    {
        //NSLog(@"3");
        for(int ii = i; ii<i+3; ii++)
        {
            //NSLog(@"4");
            if([[vakjesLijst objectAtIndex:ii] currentTitle] == playerType)
            {
                hoeveelheidGemarkeerdeVakjes++;
            }
        }
        if(hoeveelheidGemarkeerdeVakjes == 3)
        {
            [btnPlay setTitle:@"Speel nog een keer" forState: (UIControlStateNormal)];
            NSLog(@"Hoera speler %@ heeft gewonnen", playerType);
            NSString *temp = [[NSString alloc] initWithFormat:@"Hoera speler %@ heeft gewonnen", playerType];
            [label setText:temp];
            [temp release];
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
    [self init:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
