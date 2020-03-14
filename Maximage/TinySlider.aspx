<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TinySlider.aspx.cs" Inherits="Maximage.TinySlider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.2/tiny-slider.css" />
        <style>
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0
        }

        .row-container {
position: absolute; top: 100px; left: 0; right: 0; bottom: 0; background-color: red         }

        .row-container iframe {display: block; width: 100%; height: 100%; border: none;}

    </style>

</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.2/min/tiny-slider.js"></script>
    <script src="/Scripts/jquery-3.4.1.min.js"></script>

    <script>
        $(document).ready(function () {
            tns({
                container: '.my-slider',
                items: 1,
                responsive: {
                    640: {
                        edgePadding: 20,
                        gutter: 20,
                        items: 2
                    },
                    900: {
                        items: 1
                    }
                },
                autoWidth: true,
                autoHeight: true,
            });
        });
    </script>
    <div class="my-slider">
        <div>
            <img src="1.png" alt="" />
        </div>
        <div>
            <img src="2.png" alt="" />
        </div>

        <div class="row-container">
            <iframe src="https://www.youtube.com/embed/XoagfiWOuBE?enablejsapi=1"></iframe>
        </div>

        <div>
            <img src="3.png" alt="" />
        </div>
        <div>
            <img src="4.png" alt="" />
        </div>
    </div>
</body>
</html>
