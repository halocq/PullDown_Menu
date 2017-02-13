//
//  DhSharedDropList.m
//  DunkShoe
//
//  Created by lufly on 15/12/2016.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import "DhSharedDropList.h"
#import "UIutils.h"

@interface DhSharedDropList()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *mData;

@end

@implementation DhSharedDropList

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame withData:(NSArray *)data{
    self = [super initWithFrame:frame];
    
    float height = [data count] * 50;
    
    _mData = data;
    
    _vTb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _vTb.scrollEnabled = NO;
    _vTb.delegate = self;
    _vTb.dataSource = self;
    _vTb.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_vTb];
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_mData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = C6;
        cell.textLabel.highlightedTextColor = C2;
        [cell.contentView addSubview:[UIutils createLineView:CGRectMake(0, 49.5, WIN_WIDTH, 0.5)]];
    }
    
    cell.textLabel.text = V(_mData[indexPath.row], @"name");
    
    if ([_selectType isEqualToString:V(_mData[0], @"name")] && indexPath.row == 0) {
        [cell.textLabel setHighlighted:YES];
    }
    
    if ([cell.textLabel.text isEqualToString:_selectType]) {
        [cell.textLabel setHighlighted:YES];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [delegate refreshView:[_mData objectAtIndex:indexPath.row]];
    _selectType = V(_mData[indexPath.row], @"name");
    [_vTb reloadData];
}

- (void)showList{
    [_vTb reloadData];
    [UIView animateWithDuration:0.25 animations:^{
        self.height = [_mData count] * 50;
        self.vTb.height = self.height;
    }];
}

- (void)hideList{
    [UIView animateWithDuration:0.25 animations:^{
        self.height = 0;
        self.vTb.height = self.height;
    }];
}

@end
