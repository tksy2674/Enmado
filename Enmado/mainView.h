//
//  mainView.h
//  Enmado
//
//  Created by 土橋臣吾 on 2015/01/04.
//  Copyright (c) 2015年 土橋臣吾ゼミナール. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Foundation/Foundation.h>

@interface mainView : UIViewController{
    NSString *arguments;
}
@property NSString *arguments;

@property (weak, nonatomic) IBOutlet UIImageView *frameIV;
@property (weak, nonatomic) IBOutlet UIImageView *bottomPic;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *TweetBtn;
- (IBAction)TweetAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *windowsBtn;
- (IBAction)collectionLaunch:(id)sender;


@end
