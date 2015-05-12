//
//  LoginViewController.h
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>

//Create custom protocol
@protocol LoginViewControllerDelegate <NSObject>


@end
@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonPressed:(UIButton *)sender;

- (IBAction)newUserButtonPressed:(UIButton *)sender;

@end
