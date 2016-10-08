//
//  CustomCell.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()

@property (weak, nonatomic) IBOutlet UIImageView *HeadView;

@end

@implementation CustomCell

+(instancetype)GetCellWithTableView:(UITableView *)tableView
{
    static NSString *identfire=@"FirstCell";
    
    CustomCell *cell=[tableView dequeueReusableCellWithIdentifier:identfire];
    
    if (!cell) {
        
        cell=[[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:nil options:nil] firstObject];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.HeadView.layer.cornerRadius=65/2;
        cell.HeadView.layer.masksToBounds=YES;
    }
    
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
