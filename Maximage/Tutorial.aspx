<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tutorial.aspx.cs" Inherits="Maximage.Tutorial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #slider {
            width: 100%;
            margin: 0;
            border: 0;
            .slide

        {
            width: 100%;
            display: none;
            &:first-child

        {
            display: block;
        }

        .slide-inner {
            position: relative;
            img

        {
            width: 100%;
        }

        }
        }
        }

        .video-wrap {
            position: relative;
            //slider resolution = 1600 x 650, so this percentage is from 650/1600=0.40625 padding-bottom: 40.625%;
            height: 0;
            overflow: hidden;
        }

            .video-wrap iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
    </style>
    <script src='<%=ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js") %>' type="text/javascript"></script>
    <script src='https://malsup.github.io/min/jquery.cycle2.min.js' type="text/javascript"></script>
</head>
<body>
    <script>
        $(document).ready(function () {
            $('#slider').cycle({
                slides: '.slide',
                fx: 'scrollHorz',
                timeout: 6000,
            });
        })

        var player
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player', {
                events: {
                    'onStateChange': onPlayerStateChange,
                }
            });
        }
        function onPlayerStateChange(event) {
            if (event.data == YT.PlayerState.PLAYING) {
                $('#slider').cycle('pause');
            }
            if (event.data == YT.PlayerState.ENDED) {
                $('#slider').cycle('resume');
            }
        }
        function stopVideo() {
            player.stopVideo();
        }
    </script>
    <div class="page-wrapper">
        <div id="slider" class="slider">

            <div class="slide">
                <img src="1.png" class="slide-image" alt="Placeholder">
            </div>
            <!-- slide -->
            <div class="slide">
                <div class="video-wrap">
                    <iframe id="player" src="https://www.youtube.com/embed/Lscb4SL58X4?enablejsapi=1" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            <!-- slide -->
        </div>
        <!-- slider -->
    </div>
</body>
</html>
