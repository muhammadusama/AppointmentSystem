//
//  CalenderViewController.h
//  MedMaster
//
//  Created by Mani on 5/31/12.
//  Copyright (c) 2012 Master Mobie Products. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "KLCalendarView.h"
//#import "AddPatientViewController.h"

@protocol CalenderViewDelegate

@optional
- (void)DateSelected:(NSString *)Date;

@end

@class AddPatientViewController;

@interface CalenderViewController : UIViewController<KLCalendarViewDelegate>{

    KLCalendarView                              *kal;
    id<CalenderViewDelegate> __delegate;

}
@property (nonatomic, assign) id<CalenderViewDelegate> delegate;
@property (nonatomic, retain) id parent;

@end
