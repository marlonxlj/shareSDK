##分享新浪微博

###★★★分享新浪微博★★★

###前言：
写这个目地是为了记录那些过坑，直接先上效果图。大家看看如果你遇到了应该如果处理更好，因为刚一看到这个效果的时候就明白其它很简单不就是分享微博吧。但是要求是不需要我们进行手动的授权和不需要进入到分享的编辑界面。然而在做的过程中才发现坑啊，永远都是那么的多~~~~~
![aa.gif](http://upload-images.jianshu.io/upload_images/1819746-5bc31b490fa61996.gif?imageMogr2/auto-orient/strip)

####感觉如何很简单吧，那么就开始行动吧。

###Mark一下思路吧
***
####1. 一看到这个就想到使用第三方，第三方中首先想到了大家都很熟悉的友盟社会化分享。
####2. 使用Sharedsdk来实现这个效果
####3. 使用微博的原生SDK来做

###补充一下从上面的思路实现的情况：
***
1. 当使用友盟社会化分享的时候很容易就可以实现到我们平常看到的那样，编辑界面的。不符合我们的需求，但是我不死心啊，就在网上联系了友盟的在线客服。他们被阿里收了，要用淘宝的账号的登录。好吧，我忍了。进行去问了半天，等了半天。结果那个小美女给我说，他们的技术说了这个实现不了的。微博只提供了打开微博界面的接口，我想了想，总感觉有哪里不对，然后就果断的放弃了友盟了。

2. 这个是最简单的，跟着文档做就没什么问题了，但是有坑好大的坑。坑的我都快怀疑人生了，感觉五官不对了。做了心里才有好多的马奔腾的过啊

3. 这个是最最坑的，原生的感觉就是不怎么样啊。什么文档啊，什么的。找不到，一找直接让你去github了搞毛线呀。然后pod了半天动都不怎么动，以为没有墙，不对啊，我墙的啊。醉了。尝试过未实现，放弃了。

***
##下面开始讲遇到的坑关于SharedSdk,sharedsdk的版本号:`ShareSDK3(3.5.2)`
***
###如图:
![IMG_1601.PNG](http://upload-images.jianshu.io/upload_images/1819746-dd128b903b5167b7.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####1.看到这个错误是不是很想,这太简单了吧，不是就是回调地址写的不一样吧，对此我只能说那么好好的检查一下看看是不是真的地址写错了。
####而且Sharedsdk的官网也有这样错误的处理方法：[sharedSdk官网处理方案](http://bbs.mob.com/forum.php?mod=viewthread&tid=50)

根据官网的信息一下发现没有问题啊
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1819746-fa3252af7cd0e429.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###如果没有解决你的问题，请往下看~~~~~
####2. 然后官方的建议是把回调的地址写成跟官方的示例一样。嗯，没有出现这个上面的错误，出现另一个错误。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1819746-77f352d3d028b868.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####3. 同样给出解决的方案，说造成的原因是boundid不对。[sharedsdk官方解决方案](http://bbs.mob.com/forum.php?mod=viewthread&tid=19633&extra=page%3D2)

####4. 但是同样不能解决我的问题。官方解释如下：

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1819746-bafd605d25231e48.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1819746-4a01654f205209fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###主要的原因是pod的时候把这个` sharedSDK.xml` 在demo中演示的文件放到了pod管理里面，所以下载的时候就会出现授权的问题，建议sharedSDK官方修改这个bug。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1819746-31b82c24345b00d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####最后问题解决了，感谢当时帮我分析这个问题的sharedSDK官方的客服人员。感谢他为我找到了这个问题所在的原因，不然让我一个人找肯定是找不到出来的。当然不排队在他心里，当时也有很的马在咆哮。因为这个是一个很简单的问题，而这个这么简单的问题还要来麻烦我。再次感谢他~~~~~!!!!

###[代码我就不帖了，给下载的地址。](https://github.com/marlonxlj/shareSDK.git)

####🐼🐶🐶如果对你有帮助，或觉得可以。请右上角star一下，这是对我一种鼓励，让我知道我写的东西有人认可，我才会后续不断的进行完善。

###有任何问题或建议请及时issues me，以便我能更快的进行更新修复。

####Email: marlonxlj@163.com