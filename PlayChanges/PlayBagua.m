//
//  PlayBuagua.m
//  PlayChanges
//
//  Created by meng tong on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlayBagua.h"

@implementation PlayBagua

@synthesize qian;
@synthesize kun;
@synthesize gen;
@synthesize zhen;
@synthesize xun;
@synthesize dui;
@synthesize kan;
@synthesize li;

@synthesize neigua;
@synthesize waigua;
@synthesize yaoci;
@synthesize guaming;

-(NSString*) get_yaoci
{
    return [bcg get_yaoci];
}
-(void) set_bcg_label
{
    NSString *str = [NSString stringWithFormat:@"%@上%@下", bcg.waigua.name, bcg.neigua.name];
    [guaming setText:str];
}

-(IBAction) bagua_clicked:(id)sender
{
    UIButton *cb = (UIButton*)sender;
    if(index == 0){
        int num = cb.tag;
        if(bcg.neigua == nil)
            bcg.neigua = [[Bagua alloc] initWithNumber:num];
        else 
            [bcg.neigua reset_number:num];
        [neigua setBackgroundImage:bcg.neigua.img forState:UIControlStateNormal];
    }else{
        int num = cb.tag;
        if(bcg.waigua == nil)
            bcg.waigua = [[Bagua alloc] initWithNumber:num];
        else 
            [bcg.waigua reset_number:num];
        [waigua setBackgroundImage:bcg.waigua.img forState:UIControlStateNormal];
    }
    index = !index;
    if(bcg.neigua && bcg.waigua){
        [self set_bcg_label];
        [yaoci setText:[self get_yaoci]];
    }
}
-(IBAction) neigua_clicked:(id)sender
{
    bcg.neigua = nil;
     [neigua setBackgroundImage:nil forState:UIControlStateNormal];
    index = 0;
}
-(IBAction) waigua_clicked:(id)sender
{
    bcg.waigua = nil;
    [waigua setBackgroundImage:nil forState:UIControlStateNormal];
    if(bcg.neigua == nil)
        index = 0;
    else
        index = 1;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    }else{
        self = [super initWithNibName:@"PlayBaguaIpad" bundle:nibBundleOrNil];
    }
    
    if (self) {
        self.title = @"玩八卦";
        bcg = [[BaChongGua alloc] init];
        UIImage *img = [UIImage imageNamed:@"bg"];
        [self.tabBarItem setImage:img];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
