//
//  DhSharedDropButton.h
//  DunkShoe
//
//  Created by lufly on 15/12/2016.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DhSharedDropButtonDelegate <NSObject>

- (void)showList;
- (void)hideList;

@end

@interface DhSharedDropButton : UIView

- (void)viewTapped;
@property (nonatomic) NSString *title;

@property (nonatomic) id<DhSharedDropButtonDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withDefaultTitle:(NSString *)title;
@end
