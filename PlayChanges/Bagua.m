//
//  Bagua.m
//  PlayChanges
//
//  Created by 董鹏 on 12-2-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Bagua.h"

@implementation Bagua

@synthesize img;
@synthesize number;
@synthesize name;

-(id) initWithNumber:(int) num
{
    if([super init] == nil)
        return nil;
    [self reset_number:num];
    return self;
}
-(void) set_yao
{
    y1 = y2 = y3 = 0;
    int num = number - 1;
    if(num >= 4)
        y3 = 1;
    if(num % 2 == 1)
        y1 = 1;
    num = num % 4;
    if(num >= 2)
        y2 = 1;
}
-(void) set_name
{
    if(number == 1){
        name = @"乾";
    }else if(number == 2){
        name = @"兑";
    }else if(number == 3){
        name = @"离";
    }else if(number == 4){
        name = @"震";
    }else if(number == 5){
        name = @"巽";
    }else if(number == 6){
        name = @"坎";
    }else if(number == 7){
        name = @"艮";
    }else if(number == 8){
        name = @"坤";
    }
}
-(void) set_image
{
    NSString *str = [NSString stringWithFormat:@"%u%u%u.png", y3, y2, y1];
    img = [UIImage imageNamed:str];
}
-(void) reset_number:(int) num
{
    number = num;
    [self set_yao];
    [self set_name];
    [self set_image];
}
-(int) get_cuogua_number
{
    return 9 - number;
}

-(int) get_zonggua_number
{
    int num = y3 + y2 * 2 + y1 *4 + 1;
    return num;
}

@end
