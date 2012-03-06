//
//  PlayBuagua.h
//  PlayChanges
//
//  Created by meng tong on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaChongGua.h"

@interface PlayBagua : UIViewController{
    BaChongGua *bcg;
    int index;//设置哪个卦，0设置内卦，1设置外卦
}

@property (nonatomic, strong) IBOutlet UIButton *qian;
@property (nonatomic, strong) IBOutlet UIButton *kun;
@property (nonatomic, strong) IBOutlet UIButton *gen;
@property (nonatomic, strong) IBOutlet UIButton *li;
@property (nonatomic, strong) IBOutlet UIButton *kan;
@property (nonatomic, strong) IBOutlet UIButton *dui;
@property (nonatomic, strong) IBOutlet UIButton *xun;
@property (nonatomic, strong) IBOutlet UIButton *zhen;

@property (nonatomic, strong) IBOutlet UIButton *neigua;
@property (nonatomic, strong) IBOutlet UIButton *waigua;

@property (nonatomic, strong) IBOutlet UITextView *yaoci;
@property (nonatomic, strong) IBOutlet UILabel *guaming;

-(IBAction) bagua_clicked:(id)sender;
-(IBAction) neigua_clicked:(id)sender;
-(IBAction) waigua_clicked:(id)sender;
@end
