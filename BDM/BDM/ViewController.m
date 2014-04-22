//
//  ViewController.m
//  CollectionViewDemo1
//
//  Created by safadmoh on 21/04/14.
//  Copyright (c) 2014 safadmoh. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    NSMutableArray *images;
    NSMutableArray *cellWidth;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end





@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    images=[[NSMutableArray alloc]initWithObjects:@"know_more.jpeg",@"clients.jpeg",@"our_approach.jpeg",@"leadership.jpeg",@"social_impact.jpeg",@"products.jpeg",nil];
    
    cellWidth =[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:240], [NSNumber numberWithFloat:480],[NSNumber numberWithFloat:240],[NSNumber numberWithFloat:240],[NSNumber numberWithFloat:240],[NSNumber numberWithFloat:240],nil];
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"FlickrCell"];
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return images.count;
}



- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 200)];
    imageView.image=[UIImage imageNamed:[images objectAtIndex:indexPath.item]];
    
    [cell.contentView addSubview:imageView];
    
    return cell;
}





- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {    
    return CGSizeMake([[cellWidth objectAtIndex:indexPath.item] floatValue], 200);
    
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
