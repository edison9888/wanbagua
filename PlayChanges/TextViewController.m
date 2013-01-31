//
//  TextViewController.m
//  PlayChanges
//
//  Created by Peng on 13-1-31.
//
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController
-(id) initWithFile:(NSString*) f
{
    self = [super init];
    if(self == nil){
        return nil;
    }
    file = [NSString stringWithString:f];
    self.title = file;
    NSString *p = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle ] resourcePath], file];
    txt = [NSString stringWithContentsOfFile:p encoding:NSUTF8StringEncoding error:nil];
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) ui_init
{
    UIScreen *s = [UIScreen mainScreen];
    CGRect rect = [s applicationFrame];
    tv = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height - 100)];
    tv.editable = NO;
    tv.font = [UIFont systemFontOfSize:14];
    tv.text = txt;
    [self.view addSubview:tv];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ui_init];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
