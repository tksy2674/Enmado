//
//  windowCollection.h
//  Enmado
//
//  Created by 土橋臣吾 on 2015/01/08.
//  Copyright (c) 2015年 土橋臣吾ゼミナール. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainView.h"

@interface windowCollection : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property IBOutlet UICollectionView *collectionView;
@end
