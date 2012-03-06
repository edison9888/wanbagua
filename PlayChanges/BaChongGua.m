//
//  BaChongGua.m
//  PlayChanges
//
//  Created by 董鹏 on 12-2-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaChongGua.h"

@implementation BaChongGua

@synthesize neigua;
@synthesize waigua;

-(void) init_6yao
{
    int i;
    for(i = 0; i < 6; i++){
        yao6[i] = SHAOYIN;
    }
}
-(NSString*) get_yaoci
{
    NSString *path = [NSString stringWithFormat:@"%@/%d%d", [[NSBundle mainBundle] resourcePath],waigua.number, neigua.number];
    NSString *yc = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return yc;
}

-(NSString*) get_biangua_yaoci
{
    NSString *path = [NSString stringWithFormat:@"%@/%d%d", [[NSBundle mainBundle] resourcePath],bgwaigua.number, bgneigua.number];
    NSLog(@"path=%@",path);
    NSString *yc = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return yc;
}

-(NSString*) get_zonggua_yaoci
{
    NSString *path = [NSString stringWithFormat:@"%@/%d%d", [[NSBundle mainBundle] resourcePath],zgwaigua.number, zgneigua.number];
    NSString *yc = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return yc;
}

-(NSString*) get_cuogua_yaoci
{
    NSString *path = [NSString stringWithFormat:@"%@/%d%d", [[NSBundle mainBundle] resourcePath],cgwaigua.number, cgneigua.number];
    NSString *yc = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return yc;
}

-(void) set_bagua_from_6yao:(Bagua*) ng  Waigua:(Bagua*) wg lyao6:(char*) y6
{
    int i;
    ng.number = 0;
    wg.number = 0;
    
    for(i = 0; i < 6; i++){
        if(y6[i] < SHAOYIN || y6[i] > LAOYANG)
            return;
        switch (i) {
            case 0:
                ng.number += (y6[i] % 2 ? 4 : 0);
                break;
            case 1:
                ng.number += (y6[i] % 2 ? 2 : 0);
                break;
            case 2:
                ng.number += (y6[i] % 2 ? 1 : 0);
                break;
            case 3:
                wg.number += (y6[i] % 2 ? 4 : 0);
                break;
            case 4:
                wg.number += (y6[i] % 2 ? 2 : 0);
                break;
            case 5:
                wg.number += (y6[i] % 2 ? 1 : 0);
                break;
                
            default:
                break;
        }
    }
    ng.number ++;
    wg.number ++;
    [ng reset_number: ng.number];
    [wg reset_number: wg.number]; 
}

-(void) reset_biangua
{
    if(bgneigua == nil)
        bgneigua = [[Bagua alloc] initWithNumber:1];
    if(bgwaigua == nil)
        bgwaigua = [[Bagua alloc] initWithNumber:1];
    int i;
    for(i = 0; i < 6; i++){
        if(yao6[i] == 1 || yao6[i] == 2){
            bgyao6[i] = yao6[i];
        }else if(yao6[i] == LAOYIN){
            bgyao6[i] = SHAOYANG;
        }else if(yao6[i] == LAOYANG ){
            bgyao6[i] = SHAOYIN;
        }
    }
    [self set_bagua_from_6yao:bgneigua Waigua:bgwaigua lyao6:bgyao6];
}

-(void) reset_cuogua
{
    if(cgneigua == nil)
        cgneigua = [[Bagua alloc] initWithNumber:1];
    if(cgwaigua == nil)
        cgwaigua = [[Bagua alloc] initWithNumber:1];
    int i;
    for(i = 0; i < 6; i++){
        if(yao6[i] == SHAOYIN || yao6[i] == LAOYIN){
            cgyao6[i] = SHAOYANG;
        }else{
            cgyao6[i] = SHAOYIN;
        }
    }
    [self set_bagua_from_6yao:cgneigua Waigua:cgwaigua lyao6:cgyao6];
}

-(void) reset_zonggua
{
    if(zgneigua == nil)
        zgneigua = [[Bagua alloc] initWithNumber:1];
    if(zgwaigua == nil)
        zgwaigua = [[Bagua alloc] initWithNumber:1];
    int i;
    for(i = 0; i < 6; i++){
        if(yao6[i] == SHAOYIN || yao6[i] == LAOYIN){
            zgyao6[5 - i] = SHAOYIN;
        }else{
            zgyao6[5 - i] = SHAOYANG;
        }
    }
    [self set_bagua_from_6yao:zgneigua Waigua:zgwaigua lyao6:zgyao6];
}

-(void) set_yao:(int) yao index:(int) index
{
    if(index < 0 || index > 6 || yao < SHAOYIN || yao > LAOYANG)
        return;
    yao6[index] = yao;
}

-(void) set_bagua_from_6yao
{
    int i;
    self.neigua.number = 0;
    self.waigua.number = 0;
    for(i = 0; i < 6; i++){
        if(yao6[i] < SHAOYIN || yao6[i] > LAOYANG)
            return;
        switch (i) {
            case 0:
                neigua.number += (yao6[i] % 2 ? 4 : 0);
                break;
            case 1:
                neigua.number += (yao6[i] % 2 ? 2 : 0);
                break;
            case 2:
                neigua.number += (yao6[i] % 2 ? 1 : 0);
                break;
            case 3:
                waigua.number += (yao6[i] % 2 ? 4 : 0);
                break;
            case 4:
                waigua.number += (yao6[i] % 2 ? 2 : 0);
                break;
            case 5:
                waigua.number += (yao6[i] % 2 ? 1 : 0);
                break;
                
            default:
                break;
        }
    }
    self.neigua.number ++;
    self.waigua.number ++;
    [self.neigua reset_number: self.neigua.number];
    [self.waigua reset_number: self.waigua.number]; 
}

-(int) get_jiaohugua_number
{
    int num;
    return num;
}
-(int) set_yuantu_index_from_neiwaigua
{
    int oldindex = yuantu_index;
    if(!neigua || !waigua){
        return -1;
    }
    if(neigua.number > 4){
        yuantu_index = (8 - neigua.number + 4 - 1) * 8 + 8 - waigua.number;
    }else{
        yuantu_index = (neigua.number - 1) * 8 + waigua.number;
    }
    if(oldindex != yuantu_index){
        //需要重新设置name，yaoci
    }
    return yuantu_index;
}
@end
