// Exercise 2:

//Khi user quit app từ fast app switcher (multi task): Delegate applicationDidEnterBackground sẽ được gọi đầu tiên rồi sau đó khi user kill app sẽ chuyển sang applicationWillTerminate
// Khi app bị crash do source code: Trong trường hợp app vừa bật lên đã crash thì hàm applicationWillTerminate sẽ được gọi luôn, nếu đã ở trạng thái active thì sẽ chuyển thành in-active và applicationWillResignActive rồi sau đó gọi hàm applicationWillTerminate.
// Khi app bị suspended: Delegate applicationDidEnterBackground sẽ được gọi. Trong trường hợp thiếu bộ nhớ, hệ thống sẽ lọc và tắt các ứng dụng đang trong trạng thái Suspended để tạo không gian trống cho các ứng dụng khác.
//Khi user mở app khác (bằng cách tap vào notification của app khác hoặc open app khác từ app hiện tại) : Lúc này app từ trạng thái active sẽ chuyển sang trạng thái in-active và delegate applicationWillResignActive sẽ được gọi, nếu để app ở phần background quá lâu sẽ dẫn đến trạng thái app bị suspended
