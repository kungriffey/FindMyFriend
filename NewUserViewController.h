//
//  NewUserViewController.h
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewUserViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *fullnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *retypePasswordTextField;

- (IBAction)createUserButtonPressed:(UIButton *)sender;

@end
