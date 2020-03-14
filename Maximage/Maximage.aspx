<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maximage.aspx.cs" Inherits="Maximage.Maximage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src='<%=ResolveClientUrl("~/Scripts/jquery-3.4.1.js") %>' type="text/javascript"></script>
    <script src='<%=ResolveClientUrl("~/Scripts/jquery-migrate-1.4.1.js") %>' type="text/javascript"></script>

    <script src='<%=ResolveClientUrl("~/Scripts/jquery.cycle.all.js") %>' type="text/javascript"></script>
    <script src='<%=ResolveClientUrl("~/Scripts/jquery.maximage.min.js") %>' type="text/javascript"></script>
    <link href='/Scripts/jquery.maximage.min.css' rel="stylesheet" type="text/css" />
    <style>
        /* Other container */
        .contentContainer {
            background: #333;
            color: #fff;
            font-family: sans-serif;
            padding: 20px;
            margin-top: 20px;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
            filter: alpha(opacity=50);
            opacity: 0.8;
        }

        /* Center my loader */
        #maximage {
            display: none;
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

        /* Overwrite Maximage's default background-size */
        div.mc-image {
            -webkit-background-size: contain;
            -moz-background-size: contain;
            -o-background-size: contain;
            background-size: contain;
        }

        /* Other random styles */
        #arrow_left, #arrow_right {
            text-decoration: none;
        }

        a {
            color: #fff;
        }

            a:hover {
                text-decoration: none;
            }

            a:active {
                color: #999;
            }

        hr {
            clear: both;
        }

        p {
            margin-bottom: 20px;
        }

        .largeTxt {
            font-size: 30px;
        }
    </style>
</head>
<body>
    <script>
        $(function () {
            $('#maximage').maximage({
                backgroundSize: "contain",
                cycleOptions: {
                    fx: 'fadeZoom',
                    //sync: false,
                    speed: 800,
                    timeout: 8000,
                    prev: '#arrow_left',
                    next: '#arrow_right',
                    pager: '#cycle-nav ul',
                    pagerAnchorBuilder: function (idx, slide) {
                        return '<li><a href="#"></a></li>';
                    }
                },
                onFirstImageLoaded: function () {
                    jQuery('#maximage').fadeIn('fast');
                }
            });

            $('.toggle').bind('click', function (e) {
                e.preventDefault();
                $('#maximage').cycle('toggle');
            });
        });
    </script>
    <!-- Maximage / Cycle -->
    <div id="maximage">
        <img src="1.png" alt="" />
        <iframe src="https://www.youtube.com/embed/XoagfiWOuBE?enablejsapi=1"></iframe>

        <img src="2.png" alt="" />
    </div>

    <div class="contentContainer">
        <p class='largeTxt'>Some Navigation Examples</p>
        <p>Arrows</p>
        <a href="" id="arrow_left">
<%--            <img src="http://www.aaronvanderzwan.com/maximage/2.0/lib/images/demo/arrow_left.png" alt="Slide Left" />--%>
            arrow_left
        </a>
        <a href="" id="arrow_right">
<%--            <img src="http://www.aaronvanderzwan.com/maximage/2.0/lib/images/demo/arrow_right.png" alt="Slide Right" />--%>
            arrow_right
        </a>
        <hr />
        <p>Nav</p>
        <div id="cycle-nav">
            <ul></ul>
        </div>
        <hr />
        <p>Toggle Pause</p>
        <a href="" class="toggle">Pause/Play it</a>
    </div>
</body>
</html>
