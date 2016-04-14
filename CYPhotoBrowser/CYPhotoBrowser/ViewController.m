//
//  ViewController.m
//  CYPhotoBrowser
//
//  Created by jeader on 16/4/14.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+photoBrowser.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        cell.selectionStyle = 0;
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 120, 110)];
        [cell.contentView addSubview:imageV];
        imageV.image = [UIImage imageNamed:@"32.jpg"];
        [imageV showBiggerPhotoInview:self.view];
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
