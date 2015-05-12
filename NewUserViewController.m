//
//  NewUserViewController.m
//  FindMyFriend
//
//  Created by Kunwardeep Gill on 2015-05-12.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "NewUserViewController.h"

@interface NewUserViewController ()

@end

@implementation NewUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
  [self.usernameTextField becomeFirstResponder];
}



#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.usernameTextField) {
    [self.passwordTextField becomeFirstResponder];
  }
  if (textField == self.passwordTextField) {
    [self.passwordTextField becomeFirstResponder];
  }
  if (textField == self.retypePasswordTextField) {
    [self.retypePasswordTextField resignFirstResponder];
    [self processFieldEntries];
  }
  
  return YES;
}



#pragma mark IBActions

- (IBAction)createUserButtonPressed:(UIButton *)sender {
  [self dismissKeyboard];
  [self processFieldEntries];
}

- (void)processFieldEntries {
  // Check that we have a non-zero username and passwords.
  // Compare password and retryPassword for equality
  // Throw up a dialog that tells them what they did wrong if they did it wrong.
  
  NSString *username = self.usernameTextField.text;
  NSString *password = self.passwordTextField.text;
  NSString *passwordAgain = self.retypePasswordTextField.text;
  NSString *errorText = @"Please ";
  NSString *usernameBlankText = @"enter a username";
  NSString *passwordBlankText = @"enter a password";
  NSString *joinText = @", and ";
  NSString *passwordMismatchText = @"enter the same password twice";
  
  BOOL textError = NO;
  
  // Messaging nil will return 0, so these checks implicitly check for nil text.
  if (username.length == 0 || password.length == 0 || passwordAgain.length == 0) {
    textError = YES;
    
    // Set up the keyboard for the first field missing input:
    if (passwordAgain.length == 0) {
      [self.retypePasswordTextField becomeFirstResponder];
    }
    if (password.length == 0) {
      [self.passwordTextField becomeFirstResponder];
    }
    if (username.length == 0) {
      [self.usernameTextField becomeFirstResponder];
    }
    
    if (username.length == 0) {
      errorText = [errorText stringByAppendingString:usernameBlankText];
    }
    
    if (password.length == 0 || passwordAgain.length == 0) {
      if (username.length == 0) { // We need some joining text in the error:
        errorText = [errorText stringByAppendingString:joinText];
      }
      errorText = [errorText stringByAppendingString:passwordBlankText];
    }
  } else if ([password compare:passwordAgain] != NSOrderedSame) {
    // We have non-zero strings.
    // Check for equal password strings.
    textError = YES;
    errorText = [errorText stringByAppendingString:passwordMismatchText];
    [self.passwordTextField becomeFirstResponder];
  }
  
  if (textError) {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:errorText message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
    return;
  }

  
}


#pragma mark Keyboard

- (void)dismissKeyboard {
  [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
