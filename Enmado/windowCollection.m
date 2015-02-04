//
//  windowCollection.m
//  Enmado
//
//  Created by 土橋臣吾 on 2015/01/08.
//  Copyright (c) 2015年 土橋臣吾ゼミナール. All rights reserved.
//

#import "windowCollection.h"

@interface windowCollection (){
    NSString *selectedName;
}
@property () NSString *frameFile;
@property () NSNumber *collectionNumber;
@end

@implementation windowCollection

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    NSString *imgName = [NSString stringWithFormat:@"window_%d.png", (int)(indexPath.row+1)];
    UIImage *image = [UIImage imageNamed:imgName];
    imageView.image = image;
      
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //cellが選択されたとき
    //なんかレイヤー順入れ替えてViewTagに2つけたら表示できた
    _frameFile = [NSString stringWithFormat:@"window_%d.png", (int)(indexPath.row+1)];
    _collectionNumber = [NSNumber numberWithInt:(int)(indexPath.row+1)];

    
    //NSLog(@"Clicked window_%d.png",(int)(indexPath.row+1));
    [self performSegueWithIdentifier:@"backMain" sender:self];

}

//画面遷移時に呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"backMain"]) {
        //ここでパラメータを渡す
        mainView *MVController = segue.destinationViewController;
        MVController.arguments = [NSString stringWithFormat:@"%@",_frameFile];
        MVController.CNumbers = _collectionNumber;
    }
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
