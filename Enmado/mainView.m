//
//  mainView.m
//  Enmado
//
//  Created by 土橋臣吾 on 2015/01/04.
//  Copyright (c) 2015年 土橋臣吾ゼミナール. All rights reserved.
//

#import "mainView.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@interface mainView ()
@property () NSString *postURL;
@property () NSString *ccLicense;

@end

@implementation mainView

@synthesize arguments = _arguments;
@synthesize CNumbers = _CNumbers;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
    NSLog(@"%@", _arguments);
    [super viewDidAppear:animated];
    //_argumentsの文字列をここで使用
    NSString *fileName = [NSString stringWithFormat:@"%@", _arguments];
    // ここではデータを保存する為に一般的に使われるDocumentsディレクトリ
    NSString *path = [NSString stringWithFormat:@"%@/temp1.png",
                      [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
    
    //imageNamedを使うよりキャッシュを貯めこまないimageWithContentsOfFile
    self.bottomPic.image = [UIImage imageWithContentsOfFile:path];
    self.frameIV.image = [UIImage imageNamed:fileName];

    int x = [_CNumbers intValue];
    switch (x) {
        case 1:
            [self.WindowCredit setText:@"Frame「P4080927」, by biscorogus"];
            break;
        
        case 2:
            [self.WindowCredit setText:@"Frame「PhoTones Works #3184」, by Takuma Kimura"];
            break;
        
        case 3:
            [self.WindowCredit setText:@"Frame「By the window」, by Susanne Nilsson"];
            break;
            
        case 4:
            [self.WindowCredit setText:@"Frame「Window View」, by Stevie Spiers"];
            break;

        case 5:
            [self.WindowCredit setText:@"Frame「明月院 円窓」, by yuki_september"];
            break;

        case 6:
            [self.WindowCredit setText:@"Frame「new route: Loop Line」, by tsuda"];
            break;
        
        case 7:
            [self.WindowCredit setText:@"Frame「機窓」, by Noriko YAMAMOTO"];
            break;
        
        case 8:
            [self.WindowCredit setText:@"「Window to the World」, by Peter Kirkeskov Rasmussen"];
            break;
            
        case 9:
            [self.WindowCredit setText:@"Frame「Window cat」, by David Curran"];
            break;
        
        case 10:
            [self.WindowCredit setText:@"Frame「PhoTones Works #3784」, by Takuma Kimura"];
            break;
            
        case 11:
            [self.WindowCredit setText:@"Frame「Through the Door」, by halfrain"];
            break;
            
        case 12:
            [self.WindowCredit setText:@"Frame「Window」, by Stephanie Yoder"];
            break;
            
        case 13:
            [self.WindowCredit setText:@"Frame「Stained Glass Window」, by Sids1"];
            break;
            
        case 14:
            [self.WindowCredit setText:@"Frame by Yosuke Watanabe"];
            break;
            
        case 15:
            [self.WindowCredit setText:@"Frame「Window」, by Andrew Kuznetsov"];
            break;
            
        case 16:
            [self.WindowCredit setText:@"Frame「kitchen window」, by liz west"];
            break;

        case 17:
            [self.WindowCredit setText:@"Frame「Rock Window, Yemen」, by Rod Waddington"];
            break;
            
        case 18:
            [self.WindowCredit setText:@"Frame「Windows」, by Brian Pirie"];
            break;
            
        case 19:
            [self.WindowCredit setText:@"Frame「Bars on the Windows」, by Mike Gifford"];
            break;
            
        case 20:
            [self.WindowCredit setText:@"Frame「Through the Door」, by halfrain"];
            break;
            
        default:
            NSLog(@"例外");
            break;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveAction:(id)sender {
    self.backBtn.hidden = YES;
    self.windowsBtn.hidden = YES;
    self.TweetBtn.hidden = YES;
    self.saveBtn.hidden = YES;
    self.WindowCredit.hidden = YES;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [self.view.layer renderInContext:ctx];
    
    NSData *pngData = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
    UIImage *screenImage = [UIImage imageWithData:pngData];
    
    self.backBtn.hidden = NO;
    self.windowsBtn.hidden = NO;
    self.TweetBtn.hidden = NO;
    self.saveBtn.hidden = NO;
    self.WindowCredit.hidden = NO;

    // PNGのデータとしてNSDataを作成します
    NSData *pngPicture = UIImagePNGRepresentation(screenImage);
    // 指定したビューをPNGで取得
    UIImage *pngImage = [UIImage imageWithData:pngPicture];
    // 取得したPNG画像をカメラロールに保存する
    UIImageWriteToSavedPhotosAlbum(pngImage, nil, nil, nil);
    UIGraphicsEndImageContext();
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @""
                                                    message: @"画像を保存しました"
                                                   delegate: nil
                                          cancelButtonTitle: @"OK"
                                          otherButtonTitles: nil];
    [alert show];
}


- (IBAction)backAction:(id)sender {
    [self performSegueWithIdentifier:@"mainToHome" sender:self];
}


- (IBAction)TweetAction:(id)sender {
    //Documentsにスクショ
    self.backBtn.hidden = YES;
    self.windowsBtn.hidden = YES;
    self.TweetBtn.hidden = YES;
    self.saveBtn.hidden = YES;
    self.WindowCredit.hidden = YES;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //UIGraphicsBeginImageContext(screenRect.size);
    UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [self.view.layer renderInContext:ctx];
    
    NSData *pngData = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
    UIImage *screenImage = [UIImage imageWithData:pngData];
    UIGraphicsEndImageContext();
    
    self.backBtn.hidden = NO;
    self.windowsBtn.hidden = NO;
    self.TweetBtn.hidden = NO;
    self.saveBtn.hidden = NO;
    self.WindowCredit.hidden = NO;
    
    // JPEGのデータとしてNSDataを作成します
    NSData *data = UIImagePNGRepresentation(screenImage);
    // 指定したビューをPNGで取得
    
    // 保存するディレクトリを指定します
    // ここではデータを保存する為に一般的に使われるDocumentsディレクトリ
    NSString *path = [NSString stringWithFormat:@"%@/composite.png",
                      [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
    
    // NSDataのwriteToFileメソッドを使ってファイルに書き込みます
    // atomically=YESの場合、同名のファイルがあったら、まずは別名で作成して、その後、ファイルの上書きを行います
    if ([data writeToFile:path atomically:YES]) {
        NSLog(@"save OK");
    } else {
        NSLog(@"save NG");
    }
    
    //ここからTweet
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        // CompletionHandlerを設定
        [composeVC setCompletionHandler:^(SLComposeViewControllerResult result) {
            [self dismissViewControllerAnimated:YES completion:nil];
            if (result == SLComposeViewControllerResultDone) {
                NSLog(@"sendTwitter success");
            }
        }];
        
        //POSTするまえにURL判定
        int x = [_CNumbers intValue]; //synthesizeしたCNumbersを使う
        switch (x) {
            case 1:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1AyKxdr"];
                _ccLicense = [NSString stringWithFormat:@"Frame「P4080927」, by biscorogus "];
                break;
                
            case 2:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1Dg9gAs"];
                _ccLicense = [NSString stringWithFormat:@"Frame「PhoTones Works #3184」, by Takuma Kimura "];
                break;
                
            case 3:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1wnNKau"];
                _ccLicense = [NSString stringWithFormat:@"Frame「By the window」, by Susanne Nilsson "];
                break;

            case 4:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1DYad4h"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Window View」, by Stevie Spiers "];
                break;
            
            case 5:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1Dx5up4"];
                _ccLicense = [NSString stringWithFormat:@"Frame「明月院 円窓」, by yuki_september "];
                break;
            
            case 6:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1ETN4OZ"];
                _ccLicense = [NSString stringWithFormat:@"Frame「new route: Loop Line」, by tsuda "];
                break;
                
            case 7:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1FBFx7q"];
                _ccLicense = [NSString stringWithFormat:@"Frame「機窓」, by Noriko YAMAMOTO "];
                break;
                
            case 8:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/17CtPi6"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Window to the World」, by Peter Kirkeskov Rasmussen "];
                break;
            
            case 9:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1BEu21P"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Window cat」, by David Curran "];
                break;
            
            case 10:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1asszQm"];
                _ccLicense = [NSString stringWithFormat:@"Frame「PhoTones Works #3784」, by Takuma Kimura "];
                break;
            
            case 11:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1Dx6AkH"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Through the Door」, by halfrain "];
                break;
            
            case 12:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1ast2BQ"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Window」, by Stephanie Yoder "];
                break;

            case 13:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1FBH51o"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Stained Glass Window」, by Sids1 "];
                break;
            
            case 14:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1wtyi2l"];
                _ccLicense = [NSString stringWithFormat:@"Frame by Yosuke Watanabe "];
                break;
            
            case 15:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1C2u6rT"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Window」, by Andrew Kuznetsov "];
                break;
            
            case 16:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1vEyRFE"];
                _ccLicense = [NSString stringWithFormat:@"Frame「kitchen window」, by liz west "];
                break;
                
            case 17:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1wtyBdm"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Rock Window, Yemen」, by Rod Waddington "];
                break;
            
            case 18:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1G037hQ"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Windows」, by Brian Pirie "];
                break;
            
            case 19:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1MXenh7"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Bars on the Windows」, by Mike Gifford "];
                break;
                
            case 20:
                _postURL = [NSString stringWithFormat:@"http://bit.ly/1Dx6AkH"];
                _ccLicense = [NSString stringWithFormat:@"Frame「Through the Door」, by halfrain "];
                break;
        }
        
        // POSTするテキストの初期設定
        NSString* message = [NSString stringWithFormat:@"Enmadoから覗いてみました"];
        [composeVC setInitialText:message];
        // URLをPOSTする場合
        [composeVC addURL:[NSURL URLWithString:_postURL]];
        // 画像をPOSTする場合
        //iOS8では[UIImage imageNamed:@"../Documents/temp.jpg"]というdir直接指定はうまくいかない
        [composeVC addImage:[[UIImage alloc] initWithContentsOfFile:path]];
        // SLComposeViewController表示
        [self presentViewController:composeVC animated:YES completion:nil];
    }

    
}
- (IBAction)collectionLaunch:(id)sender {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        NSLog(@"to_iPhone");
        [self performSegueWithIdentifier:@"toCollection" sender:self];

    }
    else if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        NSLog(@"to_iPad");
        [self performSegueWithIdentifier:@"mainToPadC" sender:self];

    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @""
                                                        message: @"Enmadoはこのデバイスに対応していません"
                                                       delegate: nil
                                              cancelButtonTitle: @"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}
@end
