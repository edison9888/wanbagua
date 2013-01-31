//
//  ShiYi.m
//  PlayChanges
//
//  Created by Peng on 13-1-31.
//
//

#import "ShiYi.h"
#import "TextViewController.h"

@interface ShiYi ()

@end

@implementation ShiYi

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"十翼", nil);
        [self.tabBarItem setImage:[UIImage imageNamed:@"shiyi.png"]];
        arr = [NSArray arrayWithObjects:@"系辞传上", @"系辞传下", @"说卦传", @"杂卦传", @"序卦传", nil];
    }
    return self;
}
-(void) ui_init
{
    UIScreen *s = [UIScreen mainScreen];
    CGRect rect = [s applicationFrame];
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height - 100)];
    tv.delegate = self;
    tv.dataSource = self;
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shiyi"];
    cell.textLabel.text = [arr objectAtIndex:[indexPath row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TextViewController *tvc = [[TextViewController alloc] initWithFile:[arr objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:tvc animated:YES];
}
@end
