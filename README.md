# CATransition
过渡 效果图
![image](https://github.com/codeliu6572/CATransition/blob/master/CATransition过渡/xiaoguo.gif)

    //set up crossfade transition
    CATransition *transition = [CATransition animation];
    //切换模式
    transition.type = kCATransitionFade;
    //apply transition to imageview backing layer
    [imageView.layer addAnimation:transition forKey:nil];

CATransition有两个属性type和subType，type设置变换效果，subType设置滑入方向

type可设置值：
   kCATransitionFade
   kCATransitionMoveIn
   kCATransitionPush
   kCATransitionReveal
 
 
subTpe可设置值
    kCATransitionFromRight
    kCATransitionFromLeft
    kCATransitionFromTop
    kCATransitionFromBottom
