//
//  MultipleAppointmentsViewController.h
//  MedMasterPro
//
//  Created by TechCorp on 13/05/2013.
//
//

#import <UIKit/UIKit.h>

@class Appointment;

@protocol MultipleAppointmentsDelegate <NSObject>

- (void)didSelectRow:(NSInteger )row withObject:(Appointment *)appointment;

@end

@interface MultipleAppointmentsViewController : UITableViewController{
    
    NSMutableArray *datasource;
    id delegate;
    UIView *sender;
}

@property (nonatomic, retain) NSMutableArray *datasource;
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) UIView *sender;

@end
