//
//  ViewController.m
//  Enmado
//
//  Created by 土橋臣吾 on 2014/12/19.
//  Copyright (c) 2014年 土橋臣吾ゼミナール. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property () NSString *frameFile;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rollBtn:(id)sender {
    //カメラロールの呼び出し
    UIImagePickerControllerSourceType sourceType
    = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }

}

- (IBAction)cameraBtn:(id)sender {
    //カメラの起動
    UIImagePickerControllerSourceType sourceType
    = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }

}

//画像が選択されたら強制呼び出し
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
    
    //取得した写真画像を"temp1.png"として"Documents"フォルダに保存、待避
    
    NSData *data = UIImagePNGRepresentation(pickedImage);
    // 指定したビューをPNGで取得
    
    // 保存するディレクトリを指定します
    // ここではデータを保存する為に一般的に使われるDocumentsディレクトリ
    NSString *path = [NSString stringWithFormat:@"%@/temp1.png",
                      [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
    
    UIGraphicsEndImageContext();
    
    // NSDataのwriteToFileメソッドを使ってファイルに書き込みます
    // atomically=YESの場合、同名のファイルがあったら、まずは別名で作成して、その後、ファイルの上書きを行います
    if ([data writeToFile:path atomically:YES]) {
        NSLog(@"save OK");
    } else {
        NSLog(@"save NG");
    }
    
    
    //Segue
    [self performSegueWithIdentifier:@"toMain" sender:self];
}

//画面遷移時に呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"toMain"]) {
        //ここでパラメータを渡す
        mainView *MVController = segue.destinationViewController;
        MVController.arguments = [NSString stringWithFormat:@"window_1.png"];

    }
}



@end
