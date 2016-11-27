# WKWebView
 将WKWebView加载的网页转成图片：
 1.首先创建当前的画面的SnapView，覆盖在WkWebView上方。记录当前ContentOffset
 2.页面滚动到起始位置，一次截取每页的图片（一页的大小跟WKWebView的frame一致）
 3.拼接2中的所有图片。页面滚回1中的ContentOffset位置，去掉SnapView

# English
 Convert whole content in WKWebView to one image:
 1.Make snap view of current content and show above WKWebView. Record current content offset
 2.Scroll to top, and get each image of each page
 3.Concat images into one image. Scroll to record content offset and remove snap view in 1

# use
[_webView captureContentImage:^(UIImage *image) {
  //TODO：
}]; 
