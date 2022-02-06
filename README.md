# mpv-scripts
day_night_mode

Since mpv is great player with rtsp protocol, I decided write this code so that you can switch parameters in ip cameras through keybind of mpv. In this case, it switches the infrared light to on or off. To communicate with tapo cameras to switch some parameters we use the pytapo repository.
<p>
To run mpv player via terminal for one or all ip cameras example:
<br/>
$ nohup mpv rtsp://login:pass@address:port/stream2 > /dev/null 2>&1&
<p>
or we can create a link to application with command for three ip cameras example:
<br/>
mpv rtsp://login:pass@address:port/stream2 | mpv rtsp://login:pass@address:port/stream2 | mpv rtsp://login:pass@address:port/stream2
<p>
mvp player: https://github.com/mpv-player
<br/>
pytapo: https://github.com/JurajNyiri/pytapo
<br/>
Watch the video example https://www.youtube.com/watch?v=tFgwjiOdSPQ
<p>
