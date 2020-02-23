//
//  PlaceCell.m
//  MyFlight
//
//  Created by Olga Melnik on 23.02.2020.
//  Copyright © 2020 Olga Melnik. All rights reserved.
//

#import "PlaceCell.h"

@implementation PlaceCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 10.0, self.bounds.size.width - 40, self.bounds.size.height/2 - 10)];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView  addSubview:_nameLabel];
        
        _codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_nameLabel.frame) + 10, self.bounds.size.width - 40.0, self.bounds.size.height/2 - 10.0)];
        _codeLabel.textAlignment = NSTextAlignmentLeft;
        _codeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_codeLabel];
        
    }
    return self;
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
