//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Dominique on 12/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"
#import "BNROverlayView.h"

@interface BNRDetailViewController () <UINavigationControllerDelegate,
                                        UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toollBar;
@property (weak, nonatomic) IBOutlet UIButton *clearImageButton;

@end

@implementation BNRDetailViewController

- (IBAction)clearImage:(id)sender {
    NSString *key = self.item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    self.imageView.image = nil;
    self.clearImageButton.enabled = NO;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    [[BNRImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        imagePicker.cameraOverlayView = [self overlay];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (UIView *)overlay
{
    CGRect bounds = self.view.bounds;
    NSUInteger size = 20;
    CGRect rect = CGRectMake(bounds.size.width / 2.0 - size, bounds.size.height / 2.0 - size, 2 * size, 2 * size);
    BNROverlayView *overlay = [[BNROverlayView alloc] initWithFrame:rect];
    
    return overlay;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    self.nameField.text = item.itemName;
    self.serialField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    static NSDateFormatter *dateFormatter = nil;
    
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *imageKey = self.item.itemKey;
    
    // Get image
    UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:imageKey];
    
    // Use image to put on screen
    self.imageView.image = imageToDisplay;
    if (imageToDisplay) {
        self.clearImageButton.enabled = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (void) setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}
@end
