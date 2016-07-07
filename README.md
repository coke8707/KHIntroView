# KHIntroView
동영상 재생 인트로 화면 

How to
    
    MefiaPlayer.framework add
    
    
    KHIntroView *introView = [[KHIntroView alloc]initWithFrame:self.view.bounds];
    
    [introView setDelegate:self];
    
    NSURL *videoURL = [NSURL URLWithString:@"Video Url"];
    
    [introView setFilePath:videoURL.absoluteString];
    
    [introView setEndAnimationDuration:5.0f];
    
    [introView setChildViews:@[<#UIView#>]];
    
    [self.view addSubview:introView];
    
    [introView showIntro];
    

    
    
    
