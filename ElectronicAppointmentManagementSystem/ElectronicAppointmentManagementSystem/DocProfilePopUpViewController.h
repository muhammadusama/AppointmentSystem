//
//  DocProfilePopUpViewController.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/15/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//


#import <UIKit/UIKit.h>

@class DoctorInfoItem;
@class CustomCellForDoctorPopOver;
@class DoctorProfileViewController;

@protocol ShowProfileDelegate <NSObject>

-(void)ShowProfile:(DoctorInfoItem*)doctorInfoItem;
@end

@interface DocProfilePopUpViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    id<ShowProfileDelegate>myDelegate;
}

@property (weak, nonatomic) IBOutlet UITableView *tableViewDoctor;
@property (nonatomic, retain) NSMutableArray *arrayDocPopOver;
@property (nonatomic, retain) id<ShowProfileDelegate>myDelegate;

@end


