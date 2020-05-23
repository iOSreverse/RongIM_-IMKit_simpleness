//
//  DWConversationListViewController.m
//  RongIM_-IMKit_simpleness
//
//  Created by wdw on 2020/5/16.
//  Copyright © 2020 wdw. All rights reserved.
//

#import "DWConversationListViewController.h"

@interface DWConversationListViewController ()

@end

@implementation DWConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"会话列表";
    [self setDisplayConversationTypeArray:@[@(ConversationType_GROUP), @(ConversationType_PRIVATE)]];
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc] initWithConversationType:model.conversationType targetId:model.targetId];
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
}

@end
