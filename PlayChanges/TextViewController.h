//
//  TextViewController.h
//  PlayChanges
//
//  Created by Peng on 13-1-31.
//
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController{
    NSString *file;
    NSString *txt;
    UITextView *tv;
}

-(id) initWithFile:(NSString*) f;
@end
