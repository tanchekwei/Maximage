<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Youtube API with Iframe.aspx.cs" Inherits="Maximage.Youtube_API_with_Iframe" %>

<!DOCTYPE html>
<head>
    <meta charset='utf-8' />
    <title>Demo | MaxImage 2.0</title>

    <meta content='jQuery Plugin to make jQuery Cycle Plugin work as a fullscreen background image slideshow' name='description' />


    <style>
        
    </style>

</head>
<body>
            <iframe id="player1" width="100%" height="100%" src="https://www.youtube.com/embed/KVwSP51KVO8?enabledjsapi=1" frameborder="0" class="youtube-video" allowfullscreen></iframe>


    <script id="youtube-tracking-script">

        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";

        var firstScriptTag = document.getElementById("youtube-tracking-script");
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        var video;

        function onYouTubeIframeAPIReady() {
            video = new YT.Player('player1', {
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


