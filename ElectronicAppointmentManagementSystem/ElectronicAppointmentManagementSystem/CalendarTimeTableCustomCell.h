//
//  CalendarTimeTableCustomCell.h
//  MedMasterPro
//
//  Created by Hanny on 9/20/12.
//
//

#import <UIKit/UIKit.h>

@interface CalendarTimeTableCustomCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UIView *innerViewOne;
@property (retain, nonatomic) IBOutlet UILabel *appointmentTitleLabelOne;
@property (retain, nonatomic) IBOutlet UILabel *locationLabelOne;

@property (retain, nonatomic) IBOutlet UIView *innerViewTwo;
@property (retain, nonatomic) IBOutlet UIView *innerViewThree;
@property (retain, nonatomic) IBOutlet UIView *innerViewFour;

@property (retain, nonatomic) IBOutlet UILabel *appointmentTitleLabelTwo;
@property (retain, nonatomic) IBOutlet UILabel *locationLabelTwo;
@property (retain, nonatomic) IBOutlet UILabel *appointmentTitleLabelThree;
@property (retain, nonatomic) IBOutlet UILabel *locationLabelThree;
@property (retain, nonatomic) IBOutlet UILabel *appointmentTitleLabelFour;
@property (retain, nonatomic) IBOutlet UILabel *locationLabelFour;

@property (retain, nonatomic) IBOutlet UIButton *button15;
@property (retain, nonatomic) IBOutlet UIButton *button30;
@property (retain, nonatomic) IBOutlet UIButton *button45;
@property (retain, nonatomic) IBOutlet UIButton *button60;

-(IBAction)timeTableCellButtonTpd:(id)sender;

@end
