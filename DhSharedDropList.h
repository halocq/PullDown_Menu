//
//  DhSharedDropList.h
//  DunkShoe
//
//  Created by lufly on 15/12/2016.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DhSharedDropListDelegate  <NSObject>

- (void)refreshView:(NSDictionary *)data;

@end

@interface DhSharedDropList : UIView

@property (nonatomic) UITableView *vTb;
@property (nonatomic) NSString *selectType;

@property (nonatomic) id<DhSharedDropListDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withData:(NSArray *)data;

- (void)showList;
- (void)hideList;

@end
