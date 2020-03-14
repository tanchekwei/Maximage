<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Only Youtube Iframe API.aspx.cs" Inherits="Maximage.Only_Youtube_Iframe_API" %>


<!DOCTYPE html>
<head>
    <meta charset='utf-8' />
    <title>Demo | MaxImage 2.0</title>

    <meta content='jQuery Plugin to make jQuery Cycle Plugin work as a fullscreen background image slideshow' name='description' />


    <style>
        
    </style>

</head>
<body>
    <div id="video-youtube"></div>

    <script id="youtube-tracking-script">
        var youtubeVideoId = 'u3A7bmEOtaU'; // replace with your own video id

        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";

        var firstScriptTag = document.getElementById("youtube-tracking-script");
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        var video;

        function onYouTubeIframeAPIReady() {
            video = new YT.Player('video-youtube', {
                height: '100%',
                width: '100%',
                videoId: youtubeVideoId,
                playerVars: { rel: 0, showinfo: 0 },
                origin: 'https://example.com',
                events: {
                    'onReady': function () {
                        console.log("YouTube Video is READY!!");
                    },
                    'onStateChange': videoPlay
                }
            });
        }

        function videoPlay(event) {
            if (event.data == YT.PlayerState.PLAYING) {
                console.log("YouTube Video is PLAYING!!");
            }
            if (event.data == YT.PlayerState.PAUSED) {
                console.log("YouTube Video is PAUSED!!");
            }
            if (event.data == YT.PlayerState.ENDED) {
                console.log("YouTube Video is ENDING!!");
            }
        }
    </script>
</body>
</html>

