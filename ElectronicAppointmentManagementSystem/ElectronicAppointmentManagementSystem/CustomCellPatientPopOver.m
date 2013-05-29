//
//  CustomCellPatientPopOver.m
//  ElectronicAppointmentManagementSystem
//
//  Created by TechCorp on 5/23/13.
//  Copyright (c) 2013 TechCorp. All rights reserved.
//

#import "CustomCellPatientPopOver.h"

@interface CustomCellPatientPopOver ()

@end

@implementation CustomCellPatientPopOver
@synthesize firstName;
@synthesize pRNumber;
@synthesize phoneNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
