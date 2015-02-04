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
            [self.WindowCredit setText:@"Creative Commons License BY-NC-SA, by biscorogus"];
            break;
        
        case 2:
            [self.WindowCredit setText:@"Creative Commons License BY-SA, by Takuma Kimura"];
            break;
        
        case 3:
            [self.WindowCredit setText:@"Creative Commons License BY-SA, by Susanne Nilsson"];
            break;
            
        case 4:
            [self.WindowCredit setText:@"Creative Commons License BY-NC-SA, by Stevie Spiers"];
            break;

        case 5:
            [self.WindowCredit setText:@"Creative Commons License BY-NC-SA, by yuki_september"];
            break;

        case 6:
            [self.WindowCredit setText:@"Creative Commons License BY-SA, by tsuda"];
            break;
        
        case 7:
            [self.WindowCredit setText:@"Creative Commons License BY, by Noriko YAMAMOTO"];
            break;
        
        case 8:
            [self.WindowCredit setText:@"CC License BY-NC-SA, by Peter Kirkeskov Rasmussen"];
            break;
            
        case 9:
            [self.WindowCredit setText:@"Creative Commons License BY-NC-SA, by David Curran"];
            break;
        
        case 10:
            [self.WindowCredit setText:@"Creative Commons License BY, by Takuma Kimura"];
            break;
            
        case 11:
            [self.WindowCredit setText:@"Creative Commons License BY-SA, by halfrain"];
            break;
            
        case 12:
            [self.WindowCredit setText:@"Creative Commons License BY-NC-SA, by Stephanie Yoder"];
            break;
            
        case 13:
            [self.WindowCredit setText:@"Creative Commons License BY, by Sids1"];
            break;
            
        case 14:
            [self.WindowCredit setText:@"Creative Commons License BY, by Yosuke Watanabe"];
            break;
            
        case 15:
            [self.WindowCredit setText:@"Creative Commons License BY, by Andrew Kuznetsov"];
            break;
            
        case 16:
            [self.WindowCredit setText:@"Creative Commons License BY, by liz west"];
            break;

        case 17:
            [self.WindowCredit setText:@"Creative Commons License BY-SA, by Rod Waddington"];
            break;
            
        case 18:
            [self.WindowCredit setText:@"Creative Commons License BY, by Brian Pirie"];
            break;
            
        case 19:
            [self.WindowCredit setText:@"Creative Commons License BY-NC-SA, by Mike Gifford"];
            break;
            
        case 20:
            [self.WindowCredit setText:@"Creative Commons License BY-SA, by halfrain"];
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
        
        // POSTするテキストの初期設定
        NSString* message = [NSString stringWithFormat:@"Enmadoから覗いてみました"];
        [composeVC setInitialText:message];
        // URLをPOSTする場合
        [composeVC addURL:[NSURL URLWithString:@"https://itunes.apple.com/jp"]];
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
