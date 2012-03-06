//
//  Liuyao.m
//  PlayChanges
//
//  Created by meng tong on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Liuyao.h"

@implementation Liuyao

@synthesize pv;
@synthesize tv;
@synthesize pview;
@synthesize pok;
@synthesize pcancel;
@synthesize ok;
@synthesize yao1;
@synthesize yao2;
@synthesize yao3;
@synthesize yao4;
@synthesize yao5;
@synthesize yao6;


-(IBAction) bg_clicked:(id)sender
{
    [bcg reset_biangua];
    [tv setText:[bcg get_biangua_yaoci]];
}
-(IBAction) cg_clicked:(id)sender
{
    [bcg reset_cuogua];
    [tv setText:[bcg get_cuogua_yaoci]];
}
-(IBAction) zg_clicked:(id)sender
{
    [bcg reset_zonggua];
    [tv setText:[bcg get_zonggua_yaoci]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selected_yinyang = row + 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [items objectAtIndex:row];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}
-(IBAction) yao_clicked:(id)sender
{
    pview.frame = CGRectMake(0, 120, 320, 274);
    [self.view addSubview:pview];
    UIButton *b = (UIButton*)sender;
    target_yao = b.tag;
    curb = b;
}
-(IBAction) ok_clicked:(id)sender
{
    [bcg set_bagua_from_6yao];
    NSString *str = [bcg get_yaoci];
    tv.text = str;
}
-(IBAction) pok_clicked:(id)sender
{
    [pview removeFromSuperview];
    Bagua *bg;
    if(target_yao > 3){
        bg = bcg.waigua;
    }else{
        bg = bcg.neigua;
    }
    [curb setTitle:[items objectAtIndex:selected_yinyang -1] forState:UIControlStateNormal];
    [bcg set_yao:selected_yinyang index:target_yao];
}
-(IBAction) pcancle_clicked:(id)sender
{
    [pview removeFromSuperview];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"六爻预测";
        selected_yinyang = 1;
        items = [[NSArray alloc] initWithObjects:@"少阴", @"少阳", @"老阴", @"老阳", nil];
        bcg = [[BaChongGua alloc] init];
        [bcg init_6yao];
        bcg.neigua = [[Bagua alloc] initWithNumber:1];
        bcg.waigua = [[Bagua alloc] initWithNumber:1];
        [self.tabBarItem setImage: [UIImage imageNamed:@"liuyao"]];
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
