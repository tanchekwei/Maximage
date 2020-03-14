<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maximage basic.aspx.cs" Inherits="Maximage.Maximage_basic" %>

<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8' />
    <title>Demo | MaxImage 2.0</title>

    <meta content='jQuery Plugin to make jQuery Cycle Plugin work as a fullscreen background image slideshow' name='description' />
    <meta content='Aaron Vanderzwan' name='author' />

    <meta name="distribution" content="global" />
    <meta name="language" content="en" />
    <meta content='width=device-width, initial-scale=1.0' name='viewport' />

    <link rel="stylesheet" href="<%=ResolveClientUrl("~/Scripts/jquery.maximage.css?v=1.2") %>" type="text/css" media="screen" charset="utf-8" />
    <%--    <link rel="stylesheet" href="<%=ResolveClientUrl("~/Scripts/screen.css?v=1.2") %>" type="text/css" media="screen" charset="utf-8" />--%>

    <style>
        /* I wanted to center my loader */
        #cycle-loader {
            height: 32px;
            left: 50%;
            margin: -8px 0 0 -8px;
            position: absolute;
            top: 50%;
            width: 32px;
            z-index: 999;
        }

        /*I want to avoid jumpiness as the JS loads, so I initially hide my cycle*/
        #maximage {
            /*display:none;/* Only use this if you fade it in again after the images load */
            position: fixed !important;
        }

        /*Set my gradient above all images*/
        #gradient {
            left: 0;
            height: 100%;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 999;
        }

        /*Set my logo in bottom left*/
        #logo {
            bottom: 30px;
            height: auto;
            left: 30px;
            position: absolute;
            width: 34%;
            z-index: 1000;
        }

            #logo img {
                width: 100%;
            }

        #arrow_left, #arrow_right {
            bottom: 30px;
            height: 67px;
            position: absolute;
            right: 30px;
            width: 36px;
            z-index: 1000;
        }

        #arrow_left {
            right: 86px;
        }

            #arrow_left:hover, #arrow_right:hover {
                bottom: 29px;
            }

            #arrow_left:active, #arrow_right:active {
                bottom: 28px;
            }

        a {
            color: #666;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }

        .light-text {
            color: #ddd;
            text-shadow: 0 1px 0 #666;
        }

        .smaller-text {
            font-size: 30px;
        }

        .youtube-video, video {
            left: 0;
            position: absolute;
            top: 0;
        }

        /*I want to style my pager*/
        #cycle-nav {
            float: left;
            margin-bottom: 20px;
        }

            #cycle-nav ul {
                list-style-type: none;
            }

                #cycle-nav ul li {
                    border: 1px solid #ffffcc;
                    float: left;
                    margin: 4px;
                }

                    #cycle-nav ul li a {
                        background: #fff;
                        float: left;
                        height: 10px;
                        margin: 2px;
                        width: 10px;
                    }

                    #cycle-nav ul li.activeSlide {
                        border: 1px solid #FF8000;
                    }
    </style>

    <!--[if IE 6]>
			<style type="text/css" media="screen">
				/*I don't feel like messing with pngs for this browser... sorry*/
				#gradient {display:none;}
			</style>
		<![endif]-->
</head>
<body>
    <script>
        var createPlayerQueue = [];
        // Function wrapping code.
        // fn - reference to function.
        // context - what you want "this" to be.
        // params - array of parameters to pass to function.
        var wrapFunction = function (fn, context, params) {
            return function () {
                fn.apply(context, params);
            };
        }

    </script>
    <a href="" id="arrow_left">left</a>
    <a href="" id="arrow_right">right</a>

    <img id="cycle-loader" src="ajax-loader.gif" />
    <div id="maximage">
        <img src="2.png" alt="" />
        <%--<div>
            <img alt="" />
            <iframe id="player1" width="100%" height="100%" src="https://www.youtube.com/embed/KVwSP51KVO8?enabledjsapi=1" frameborder="0" class="youtube-video" allowfullscreen></iframe>
        </div>--%>
        <% 
            var videoCount = 1;
            foreach (var item in model)
            {
                Type t = item.GetType();
                System.Reflection.PropertyInfo p = t.GetProperty("IsVideo");
                object v = p.GetValue(item, null);

                if (!(bool)v)
                {
                    object link = item?.GetType().GetProperty("ImageLink")?.GetValue(item, null);
        %>
        <img alt="" src="<%=link.ToString()%>" />
        <%
            }
            else
            {

                object link = item?.GetType().GetProperty("VideoLink")?.GetValue(item, null);

        %>

<%--        <script>
            createPlayerQueue.push(wrapFunction(CreatePlayer, this, ['player<%=videoCount%>', '<%=link.ToString()%>']));
<            CreatePlayer('player<%=videoCount%>', '<%=link.ToString()%>')
</script>--%>

        <%-- is a video --%>
        <div class="youtube-video">
            <img alt="" />
        <div id="player<%=videoCount%>"></div>
        </div>

        <%
                    videoCount++;
                }
            }%>
        <%--<div>
                        <img alt="" />
            <iframe id="player2" width="100%" height="100%" src="https://www.youtube.com/embed/gtIGhzySiuk?enabledjsapi=1" frameborder="0" class="youtube-video" allowfullscreen></iframe>
        </div>--%>
<%--        <div class="youtube-video">
            <img alt="" />
            <div id="player1"></div>
        </div>
        <img src="4.png" alt="" />--%>
    </div>
    <div id="cycle-nav">
        <ul></ul>
    </div>

    <script src='<%=ResolveClientUrl("~/Scripts/jquery-1.8.3.js") %>'></script>
    <script src="<%=ResolveClientUrl("~/Scripts/jquery.cycle.all.js") %>" type="text/javascript" charset="utf-8"></script>
    <script src="<%=ResolveClientUrl("~/Scripts/jquery.maximage.js")%>" type="text/javascript" charset="utf-8"></script>

    <script id="youtube-tracking-script" type="text/javascript" charset="utf-8">
        $(function () {
            var json = <%= Newtonsoft.Json.JsonConvert.SerializeObject(video) %>
                json.forEach((item) => {
                    createPlayerQueue.push(wrapFunction(CreatePlayer, this, [item.Key, item.Value]));
                });

            $('#maximage').maximage({
                cycleOptions: {
                    fx: 'scrollHorz',
                    speed: 1000,
                    timeout: 2000,

                    //speed: 500, // Has to match the speed for CSS transitions in jQuery.maximage.css (lines 30 - 33)
                    prev: '#arrow_left',
                    next: '#arrow_right',
                    pause: 1,
                    //before: function (last, current) {
                    //    if (!$.browser.msie) {
                    //        // Start HTML5 video when you arrive
                    //        if ($(current).find('video').length > 0) $(current).find('video')[0].play();
                    //    }
                    //},
                    //after: function (last, current) {
                    //    if (!$.browser.msie) {
                    //        // Pauses HTML5 video when you leave it
                    //        if ($(last).find('video').length > 0) $(last).find('video')[0].pause();
                    //    }
                    //},
                    pager: '#cycle-nav ul',
                    pagerAnchorBuilder: function (idx, slide) {
                        var imgsrc = jQuery.Slides[idx].url;
                        return '<li><a href="#" rel="nofollow"><img src=' + imgsrc + ' width="50" /></a></li>';
                    }
                },
                onFirstImageLoaded: function () {
                    jQuery('#cycle-loader').hide();
                    //jQuery('#maximage').fadeIn('fast');
                }
            });


            //loadApi();

            //var checkYT = setInterval(function () {
            //    if (YT.loaded) {
            //        console.log("YT loaded");
            //        onYouTubeIframeAPIReady();
            //        clearInterval(checkYT);
            //    }
            //}, 1000);

            //var tag = document.createElement('script');
            //tag.src = "https://www.youtube.com/iframe_api";
            //var firstScriptTag = document.getElementsByTagName('script')[0];
            //firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            //window.onYouTubeIframeAPIReady =
            //    setTimeout(this.onYTready, 500);

            // Helper function to Fill and Center the HTML5 Video
            //jQuery('video,object').maximage('maxcover');


        });



        //var youtubeVideoId = 'u3A7bmEOtaU'; // replace with your own video id


        var CreatePlayer = function (eId, link) {
            // get youtube link video id
            var video_id = link.split('embed/')[1];
            console.log('video_id1: ' + video_id);
            var questionMarkPosition = video_id.indexOf('?');
            if (questionMarkPosition != -1) {
                video_id = video_id.substring(0, questionMarkPosition);
            }
            console.log('video_id2: ' + video_id);

            //var checkYT = setInterval(function () {
            //    if (YT.loaded) {
            console.log("YT loaded");
            console.log("eId: " + eId);
            new YT.Player(eId, {
                height: '100%',
                width: '100%',
                videoId: video_id,
                rel: { enablejsapi: 1, controls: 0, disablekb: 1, origin: 'https://example.com', rel: 0 },
                events: {
                    'onReady': function () {
                        console.log("YouTube Video is READY!!");
                    },
                    'onStateChange': onStateChange
                }
            });

        }
        //    }, 100);
        //}

        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";

        var firstScriptTag = document.getElementById("youtube-tracking-script");
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        //var video;

        function onYouTubeIframeAPIReady() {
            while (createPlayerQueue.length > 0) {
                (createPlayerQueue.shift())();
            }

            //video = new YT.Player('player1', {
            //    height: '100%',
            //    width: '100%',
            //    videoId: 'KVwSP51KVO8',
            //    rel: { enablejsapi: 1, controls: 0, disablekb: 1, origin: 'https://example.com', rel: 0 },
            //    events: {
            //        'onReady': function () {
            //            console.log("YouTube Video is READY!!");
            //        },
            //        'onStateChange': onStateChange
            //    }
            //});
        }

        function onStateChange(event) {
            if (event.data == YT.PlayerState.PLAYING) {
                console.log('played');
                $('#maximage').cycle('pause');
            }
            else if (event.data == YT.PlayerState.PAUSED) {
                console.log('pause');
                $('#maximage').cycle('resume');
            }
            else if (event.data == YT.PlayerState.ENDED) {
                console.log('ended');
                $('#maximage').cycle('resume');
            }
        }


        /* load the YouTube API first */
        //function loadApi() {
        //    var j = document.createElement("script"),
        //        f = document.getElementsByTagName("script")[0];
        //    j.src = "//www.youtube.com/iframe_api";
        //    j.async = true;
        //    f.parentNode.insertBefore(j, f);
        //    console.log('API Loaded');
        //}

        //var player;
        ///*default youtube api listener*/
        //function onYouTubeIframeAPIReady() {
        //    console.log('API Ready?');
        //    player = new YT.Player('player1', {
        //        events: {
        //            'onReady': function () {
        //                console('ready');
        //            },
        //            'onStateChange': onPlayerStateChange,
        //        }
        //    });
        //    console.table(player);
            //window.YT = window.YT || {};
            //if (typeof window.YT.Player === 'function') {
            //    player = new window.YT.Player('player', {
            //        width: '640',
            //        height: '390',
            //        videoId: 'nE6mDCdYuwY',
            //        events: {
            //            onStateChange: yt.onPlayerStateChange,
            //            onError: yt.onPlayerError,
            //            onReady: setTimeout(yt.onPlayerReady, 4000)
            //        }
            //    });
            //}
        //}


        //onPlayerReady: function () {
        //    player.playVideo(); /* start the video */
        //    player.setVolume(1); /* set volume to 1 (accepts 0-100) */
        //},

        //function testfunc(event) { alert('hello'); }


        //function onPlayerStateChange(event) {
        //    if (event.data == YT.PlayerState.PLAYING) {
        //        console.log('played');
        //        $('#maximage').cycle('pause');
        //    }
        //    if (event.data == YT.PlayerState.ENDED) {
        //        console.log('pause');
        //        $('#maximage').cycle('resume');
        //    }

            //console.log(e.data, YT.PlayerState.PLAYING, e.data === YT.PlayerState.PLAYING);
            //var video_data = e.target.getVideoData();

            ////do something on video ends
            //if (e.data === YT.PlayerState.ENDED)
            //    this.onPlayerStop();
        //}

            //onPlayerStop: function () {
            //    //console.log('video ended');
            //},

            //onPlayerError: function (e) {
            //    console.log("youtube: " + e.target.src + " - " + e.data);
            //},

            //init: function () {
            //    this.loadApi();
            //}

        //}





















        //var player;
        //function onYTready() {
        //    alert("iframe ready!");
        //    console.log("%c iframe ready!", 'background: #222; color: #bada55');
        //    player = new YT.Player('player1', {
        //        events: {
        //            'onStateChange': onPlayerStateChange,
        //        }
        //    });
        //}

        //function onPlayerStateChange(event) {
        //    if (event.data == YT.PlayerState.PLAYING) {
        //        $('#maximage').cycle('pause');
        //    }
        //    if (event.data == YT.PlayerState.ENDED) {
        //        $('#maximage').cycle('resume');
        //    }
        //}
        //function stopVideo() {
        //    player.stopVideo();
        //}
    </script>
</body>
</html>

