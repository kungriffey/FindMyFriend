//
//  NewUserViewController.h
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <UIKit/UIKit.h>

//Tell the compiler that that the current class exists
@class NewUserViewController;

//Create a new protocol
@protocol NewUserViewControllerDelegate <NSObject>

- (void)newUserViewControllerDidSignup:(NewUserViewController *)controller;

@end

@interface NewUserViewController : UIViewController

//custom Delegate
@property (weak, nonatomic) id <NewUserViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *fullnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *retypePasswordTextField;

- (IBAction)createUserButtonPressed:(UIButton *)sender;

@end
