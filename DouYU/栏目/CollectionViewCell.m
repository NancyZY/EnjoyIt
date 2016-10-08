//
//  CollectionViewCell.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 30/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation CollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1){
            NSLog(@"failed");
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]){
            NSLog(@"failed");
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    
    self.imageView.image = nil;
    self.label = nil;
}

-(void)setContentWith:(ColumnModel *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[model.game_icon stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"Image_no_data.png"]];
    self.label.text = model.game_name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
