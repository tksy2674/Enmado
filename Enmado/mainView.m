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
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)TweetAction:(id)sender {
    //Documentsにスクショ
    self.backBtn.hidden = YES;
    self.windowsBtn.hidden = YES;
    self.TweetBtn.hidden = YES;
    self.saveBtn.hidden = YES;
    
    
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
        NSString* message = [NSString stringWithFormat:@"testing on iOS8"];
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
    [self performSegueWithIdentifier:@"toCollection" sender:self];
}
@end
