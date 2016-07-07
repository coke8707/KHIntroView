//
//  KHIntroView.m
//  IntroTamplete
//
//  Created by DevLee on 2016. 7. 6..
//  Copyright © 2016년 DevLee. All rights reserved.
//

#import "KHIntroView.h"

@implementation KHIntroView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpPlayer];
        [self setUpScrollView];
    }
    return self;
}

-(void)setUpPlayer
{
    player = [[MPMoviePlayerController alloc]init];
    [player setControlStyle:MPMovieControlStyleNone];
    [player setScalingMode:MPMovieScalingModeAspectFill];
    [player setRepeatMode:MPMovieRepeatModeOne];
    [player.view setFrame:self.bounds];
    [self addSubview:player.view];
}

-(void)setUpScrollView
{
    introScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [introScrollView setDelegate:self];
    
    [introScrollView setPagingEnabled:YES];
    [self addSubview:introScrollView];
}

-(void)scrollContent
{
    for (NSInteger i = 0; i < self.childViews.count; i++) {
        
        UIView *addContentView = [self.childViews objectAtIndex:i];
        [addContentView setFrame:CGRectMake(i *CGRectGetWidth(self.frame), 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        [introScrollView addSubview:addContentView];
    }
    [introScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.frame) * self.childViews.count, CGRectGetHeight(self.frame))];
}

-(void)showIntro
{
    if (self.filePath.length != 0) {
        [player setContentURL:[NSURL URLWithString:self.filePath]];
        [player prepareToPlay];
    }
    [self scrollContent];
    
    if (self.endAnimationDuration > 0 && self.childViews.count == 0) {
        [self performSelector:@selector(dismissAnimation) withObject:nil afterDelay:self.endAnimationDuration];
    }
    
}


-(void)dismissAnimation
{
    [self.delegate introViewEndAnimation];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSInteger currentIndex = scrollView.contentOffset.x/CGRectGetWidth(self.frame);
    [self.delegate introViewScrollIndex:currentIndex withView:nil];
}





@end
