//
//  CalendarCell.h
//  MedMasterPro
//
//  Created by Hanny on 9/20/12.
//
//

#import <UIKit/UIKit.h>

@interface CalendarAppointmentsCustomCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *AppointmentTitle;
@property (retain, nonatomic) IBOutlet UILabel *AppointmentLocation;
@property (retain, nonatomic) IBOutlet UILabel *AppointmentTiming;
@property (retain, nonatomic) IBOutlet UILabel *ProviderName;
@property (retain, nonatomic) IBOutlet UIView *cellInnerView;
@property (retain, nonatomic) IBOutlet UIButton *indicatorButton;

@property (retain, nonatomic) IBOutlet UILabel *AppointmentNotes;


@end
