//
//  MonthCell.h
//  MedMasterPro
//
//  Created by Hanny on 3/26/13.
//
//

#import <UIKit/UIKit.h>

@interface MonthCell : UICollectionViewCell

@property (retain, nonatomic) IBOutlet UILabel *dateLabel;
@property (retain, nonatomic) IBOutlet UILabel *appointmentsLabel;
@property (retain, nonatomic) IBOutlet UIView *innerView;


@end
