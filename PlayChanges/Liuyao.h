//
//  Liuyao.h
//  PlayChanges
//
//  Created by meng tong on 12-2-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaChongGua.h"

@interface Liuyao : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>{
    NSArray *items;
    BaChongGua *bcg;
    int target_yao;
    int selected_yinyang;
    UIButton *curb;
}

@property (nonatomic, strong) IBOutlet UIView *pview;
@property (nonatomic, strong) IBOutlet UIPickerView *pv;
@property (nonatomic, strong) IBOutlet UIButton *pok;
@property (nonatomic, strong) IBOutlet UIButton *pcancel;
@property (nonatomic, strong) IBOutlet UIButton *ok;

@property (nonatomic, strong) IBOutlet UIButton *yao1;
@property (nonatomic, strong) IBOutlet UIButton *yao2;
@property (nonatomic, strong) IBOutlet UIButton *yao3;
@property (nonatomic, strong) IBOutlet UIButton *yao4;
@property (nonatomic, strong) IBOutlet UIButton *yao5;
@property (nonatomic, strong) IBOutlet UIButton *yao6;
@property (nonatomic, strong) IBOutlet UITextView *tv;

-(IBAction) yao_clicked:(id)sender;
-(IBAction) ok_clicked:(id)sender;
-(IBAction) pok_clicked:(id)sender;
-(IBAction) pcancle_clicked:(id)sender;

-(IBAction) bg_clicked:(id)sender;
-(IBAction) cg_clicked:(id)sender;
-(IBAction) zg_clicked:(id)sender;
@end
