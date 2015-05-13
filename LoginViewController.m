//
//  LoginViewController.m
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

#import "NewUserViewController.h"

@interface LoginViewController () <UITextFieldDelegate, NewUserViewControllerDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(dismissKeyboard)];
  tapGestureRecognizer.cancelsTouchesInView = NO;
  [self.view addGestureRecognizer:tapGestureRecognizer];
  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Keyboard

- (void)dismissKeyboard {
  [self.view endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonPressed:(UIButton *)sender {
  
  [self dismissKeyboard];
  [self processFieldEntries];

}

- (IBAction)newUserButtonPressed:(UIButton *)sender {
  [self presentNewUserViewController];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.userNameTextField) {
    [self.passwordTextField becomeFirstResponder];
  }
  if (textField == self.passwordTextField) {
    [self.passwordTextField resignFirstResponder];
    [self processFieldEntries];
  }
  
  return YES;
}

#pragma mark NewUserViewController

- (void)presentNewUserViewController {
  NewUserViewController *viewController = [[NewUserViewController alloc] initWithNibName:nil bundle:nil];
  viewController.delegate = self;
  [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

#pragma mark Delegate

- (void)newUserViewControllerDidSignup:(NewUserViewController *)controller {
  [self.delegate loginViewControllerDidLogin:self];
}

#pragma mark Field validation

- (void)processFieldEntries {
  // Get the username text, store it in the app delegate for now
  NSString *username = self.userNameTextField.text;
  NSString *password = self.passwordTextField.text;
  NSString *noUsernameText = @"username";
  NSString *noPasswordText = @"password";
  NSString *errorText = @"No ";
  NSString *errorTextJoin = @" or ";
  NSString *errorTextEnding = @" entered";
  BOOL textError = NO;
  
  // Messaging nil will return 0, so these checks implicitly check for nil text.
  if (username.length == 0 || password.length == 0) {
    textError = YES;
    
    // Set up the keyboard for the first field missing input:
    if (password.length == 0) {
      [self.passwordTextField becomeFirstResponder];
    }
    if (username.length == 0) {
      [self.userNameTextField becomeFirstResponder];
    }
  }
  
  if ([username length] == 0) {
    textError = YES;
    errorText = [errorText stringByAppendingString:noUsernameText];
  }
  
  if ([password length] == 0) {
    textError = YES;
    if ([username length] == 0) {
      errorText = [errorText stringByAppendingString:errorTextJoin];
    }
    errorText = [errorText stringByAppendingString:noPasswordText];
  }
  
  if (textError) {
    errorText = [errorText stringByAppendingString:errorTextEnding];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:errorText
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
    return;
  }
  
  // Everything looks good; try to log in.
  
  // Set up activity view
  
  [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
    // Tear down the activity view in all cases.
    
    if (user) {
      [self.delegate loginViewControllerDidLogin:self];
    } else {
      // Didn't get a user.
      NSLog(@"%s didn't get a user!", __PRETTY_FUNCTION__);
      
      NSString *alertTitle = nil;
      
      if (error) {
        // Something else went wrong
        alertTitle = [error userInfo][@"error"];
      } else {
        // the username or password is probably wrong.
        alertTitle = @"Couldn’t log in:\nThe username or password were wrong.";
      }
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"OK", nil];
      [alertView show];
      
      // Bring the keyboard back up, because they'll probably need to change something.
      [self.userNameTextField becomeFirstResponder];
    }
  }];
}
@end
