//
//  Bagua.h
//  PlayChanges
//
//  Created by 董鹏 on 12-2-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bagua : NSObject{
    char y1;
    char y2;
    char y3;
    int number;
    UIImage *img;
    NSString *name;
}

@property (nonatomic, strong) UIImage *img;
@property (nonatomic, assign) int number;
@property (nonatomic, strong) NSString* name;

-(void) set_yao;
-(void) set_name;
-(void) reset_number:(int) num;
-(id) initWithNumber:(int) num;

-(int) get_cuogua_number;
-(int) get_zonggua_number;

@end
