//
//  LoginViewController.h
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LoginViewController;

//Create custom protocol
@protocol LoginViewControllerDelegate <NSObject>
- (void)loginViewControllerDidLogin:(LoginViewController *)controller;

@end
@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <LoginViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonPressed:(UIButton *)sender;
- (IBAction)newUserButtonPressed:(UIButton *)sender;

@end
