//
//  DoctorInfoItem.h
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/13/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorInfoItem : NSObject

{

    NSString *name;
    NSString *qualification;
    NSString *specialization;
    NSString *picURL;
    
}

@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *qualification;
@property (retain, nonatomic) NSString *specialization;
@property (retain, nonatomic) NSString *picURL;

@end
