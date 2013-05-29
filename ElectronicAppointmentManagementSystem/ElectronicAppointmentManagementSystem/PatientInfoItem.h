//
//  patientInfoItem.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/23/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PatientInfoItem : NSObject
{
    NSString *firstName;
    NSString *lastName;
    NSString *phoneNumber;
    NSString *emaiAddress;

}

@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) NSString *emaiAddress;
@end
