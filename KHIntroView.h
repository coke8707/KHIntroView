//
//  KHIntroView.h
//  IntroTamplete
//
//  Created by DevLee on 2016. 7. 6..
//  Copyright © 2016년 DevLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol KHIntroViewDelegate <NSObject>

@optional
/**
 
 * @desc childViews의 데이터가 있을경우 스크롤시 해당 뷰의 인덱스를 전달한다
 * @author Lee Kang Ho.
 
 */
-(void)introViewScrollIndex:(NSInteger)index withView:(UIView *)currentView;
/**
 
 * @desc endAnimationDuration값이 0보다 크거나 childViews의 데이터가 없을경우 
        showIntro 호출후 endAnimationDuration 값만큼 후에 호출된다
 * @author Lee Kang Ho.
 
 */
-(void)introViewEndAnimation;

@end


@interface KHIntroView : UIView<UIScrollViewDelegate>
{
    MPMoviePlayerController *player;
    UIScrollView *introScrollView;
}
@property (nonatomic, weak)   id<KHIntroViewDelegate> delegate;
/**
 
 * @desc Video Url Or Resource File Url
 * @author Lee Kang Ho.
 
 */
@property (nonatomic, strong) NSString *filePath;
/**
 
 * @desc Intro Scroll Content
 * @author Lee Kang Ho.
 
 */
@property (nonatomic, strong) NSArray *childViews;
/**
 
 * @desc auto View dismiss Duration
 * @author Lee Kang Ho.
 
 */
@property (nonatomic)         CGFloat endAnimationDuration;

/**
 
 * @desc Show Intro Animation
 * @author Lee Kang Ho.
 
 */
-(void)showIntro;

@end
