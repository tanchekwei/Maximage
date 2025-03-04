﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiImage.aspx.cs" Inherits="Maximage.MultiImage" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class='no-js' lang='en'>
<!--<![endif]-->
<head>
    <meta charset='utf-8' />
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
    <title>Demo | MaxImage 2.0</title>

    <meta content='jQuery Plugin to make jQuery Cycle Plugin work as a fullscreen background image slideshow' name='description' />
    <meta content='Aaron Vanderzwan' name='author' />

    <meta name="distribution" content="global" />
    <meta name="language" content="en" />
    <meta content='width=device-width, initial-scale=1.0' name='viewport' />

    <link rel="shortcut icon" href="http://www.stylexseating.com/favicon.ico" />
    <link rel="apple-touch-icon" href="http://www.stylexseating.com/favicon.png" />

    <script src='<%=ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js") %>' type="text/javascript"></script>
    <script src='<%=ResolveClientUrl("~/Scripts/jquery-migrate-1.4.1.js") %>' type="text/javascript"></script>

    <script src='<%=ResolveClientUrl("~/Scripts/jquery.cycle.all.js") %>' type="text/javascript"></script>
    <script src='<%=ResolveClientUrl("~/Scripts/jquery.maximage.min.js") %>' type="text/javascript"></script>


    <link rel="stylesheet" href="/Scripts/screen.css?v=1.2" type="text/css" media="screen" charset="utf-8" />

    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

    <style type="text/css" media="screen">
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
            display: none;
            position: fixed !important;
        }

        /*I want to style my pager*/
        #cycle-nav {
            position: absolute;
            right: 10px;
            top: 10px;
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
                        background: #ffffcc;
                        float: left;
                        height: 10px;
                        margin: 2px;
                        width: 10px;
                    }

                    #cycle-nav ul li.activeSlide {
                        border: 1px solid #ff6600;
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

        .in-slide-content {
            color: #333;
            float: right;
            font-family: 'Helvetica Neue', helvetica;
            font-size: 60px;
            font-weight: bold;
            right: 0;
            margin: 40px;
            padding: 20px;
            position: absolute;
            top: 0;
            width: 700px;
            z-index: 9999; /* Show above .gradient */
            text-shadow: 0 1px 0 #fff;
        }

        .light-text {
            color: #f0f0f0;
            text-shadow: 0 1px 0 #666;
        }

        .smaller-text {
            font-size: 40px;
        }

        .youtube-video, video {
            left: 0;
            position: absolute;
            top: 0;
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
    <a href="http://www.aaronvanderzwan.com/blog/2011/11/maximage-2-0-beta1-release/" id="logo"><img src="../lib/images/demo/logo.png" alt="MaxImage: Uses jQuery Cycle Plugin to create background slideshows" /></a>
    <a href="" id="arrow_left"><img src="../lib/images/demo/arrow_left.png" alt="Slide Left" /></a>
    <a href="" id="arrow_right"><img src="../lib/images/demo/arrow_right.png" alt="Slide Right" /></a>

    <img id="cycle-loader" src="../lib/images/ajax-loader.gif" />
    <div id="maximage">
        <div>
            <img src="../lib/images/demo/kissing.jpg" alt="" />
            <div class="in-slide-content light-text smaller-text">
                <p>Maximage does not assume anything about your in-slide HTML.  So you can resize HTML5 videos to fill the screen (using your own JS) or you can place it on the page with a standard maximized background image.</p>
                <p><a href="http://blog.aaronvanderzwan.com/2011/11/maximage-2-0-beta1-release/" target="_blank" style="font-weight:bold">More info >></a></p>
            </div>
            <video class="html5video" controls="controls" autoplay="autoplay" poster="http://www.aaronvanderzwan.com/maximage/2.0/lib/images/demo/kissing.jpg" width="320" height="240">
                <source src="http://www.aaronvanderzwan.com/maximage/2.0/lib/video/kissing.mp4" type="video/mp4" />
                <source src="http://www.aaronvanderzwan.com/maximage/2.0/lib/video/kissing.webm" type="video/webm" />
                <source src="http://www.aaronvanderzwan.com/maximage/2.0/lib/video/kissing.ogv" type="video/ogg" />
                Your browser does not support HTML5 videos.
            </video>
        </div>
        <div>
            <img src="http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" alt="" />
            <video class="html5video" controls="controls" muted="muted" poster="http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" width="640" height="360">
                <source src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4" type="video/mp4" />
                <source src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.webm" type="video/webm" />
                <source src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.ogv" type="video/ogg" />
                Your browser does not support HTML5 videos.
            </video>
        </div>
        <img src="../lib/images/demo/coalesse.jpg" alt="Coalesse" data-href="http://www.google.com/" />
        <img src="../lib/images/demo/laughing.jpg" alt="" />
        <div class="video">
            <img src="../lib/images/demo/pattern.jpg" alt="" />
            <iframe width="100%" height="100%" src="http://www.youtube.com/embed/KVwSP51KVO8?wmode=opaque" frameborder="0" class="youtube-video" allowfullscreen></iframe>
        </div>
        <img src="../lib/images/demo/roof_shooting.jpg" alt="" />
        <img src="../lib/images/demo/man.jpg" alt="" />
        <img src="../lib/images/demo/coffee_shop.jpg" alt="" />
        <img src="../lib/images/demo/gas_station.jpg" alt="" />
    </div>

    <script src='http:http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.js'></script>
    <script src="../lib/js/jquery.cycle.all.js" type="text/javascript" charset="utf-8"></script>
    <script src="../lib/js/jquery.maximage.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript" charset="utf-8">
        $(function () {
            $('#maximage').maximage({
                cycleOptions: {
                    fx: 'fade',
                    speed: 1000, // Has to match the speed for CSS transitions in jQuery.maximage.css (lines 30 - 33)
                    timeout: 0,
                    prev: '#arrow_left',
                    next: '#arrow_right',
                    pause: 1,
                    after: function (last, current) {
                        if (!$.browser.msie) {
                            if ($(last).find('video').length > 0) $(last).find('video')[0].pause();
                            if ($(current).find('video').length > 0) $(current).find('video')[0].play();
                        }
                    }
                },
                onFirstImageLoaded: function () {
                    jQuery('#cycle-loader').hide();
                    jQuery('#maximage').fadeIn('fast');
                },
                debug: true
            });

            // Helper function to Fill and Center the HTML5 Video
            jQuery('.html5video').maximage('maxcover');

            // To show it is dynamic html text
            jQuery('.in-slide-content').delay(1200).fadeIn();
        });
    </script>

    <!-- DON'T USE THIS: Insert Google Analytics code here -->
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-733524-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
</body>
</html>
