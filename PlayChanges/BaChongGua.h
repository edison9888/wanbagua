//
//  BaChongGua.h
//  PlayChanges
//
//  Created by 董鹏 on 12-2-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bagua.h"

#define SHAOYIN 1
#define SHAOYANG 2
#define LAOYIN 3
#define LAOYANG 4

@interface BaChongGua : NSObject{
    Bagua *neigua;
    Bagua *waigua;
    
    Bagua *bgneigua;
    Bagua *bgwaigua;
    
    Bagua *cgneigua;
    Bagua *cgwaigua;
    
    Bagua *zgneigua;
    Bagua *zgwaigua;
    
    char yao6[6];
    char bgyao6[6];
    char cgyao6[6];
    char zgyao6[6];
    
    NSString *name;
    NSString *yaoci;
    
    int yuantu_index;
    int fangtu_x, fangtu_y;
}

@property (nonatomic, strong) Bagua *neigua;
@property (nonatomic, strong) Bagua *waigua;

-(void) init_6yao;

-(int) get_jiaohugua_number;
-(NSString*) get_yaoci;
-(int) set_yuantu_index_from_neiwaigua;
-(void) set_yao:(int) yao index:(int) index;
-(void) set_bagua_from_6yao;

-(void) reset_biangua;
-(void) reset_cuogua;
-(void) reset_zonggua;

-(NSString*) get_biangua_yaoci;
-(NSString*) get_cuogua_yaoci;
-(NSString*) get_zonggua_yaoci;
@end
