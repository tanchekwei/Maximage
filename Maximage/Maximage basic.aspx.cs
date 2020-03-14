using System;
using System.Collections.Generic;

namespace Maximage
{
    public partial class Maximage_basic : System.Web.UI.Page
    {
        public List<object> model;
        public List<KeyValuePair<string, string>> video = new List<KeyValuePair<string, string>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            model = new List<object>
            {
                new { IsVideo = false, ImageLink = "1.png", VideoLink = string.Empty},
                new { IsVideo = true, ImageLink = string.Empty, VideoLink = "https://www.youtube.com/embed/KVwSP51KVO8?enabledjsapi=1"},
                new { IsVideo = true,ImageLink = string.Empty, VideoLink = "https://www.youtube.com/embed/gtIGhzySiuk?enabledjsapi=1"},
                new { IsVideo = false, ImageLink = "2.png", VideoLink = string.Empty},
            };

            var videoCount = 1;
            foreach (var item in model)
            {
                object isVideo = item?.GetType().GetProperty("IsVideo")?.GetValue(item, null);
                if (bool.Parse(isVideo.ToString()))
                {
                    object videoLink = item?.GetType().GetProperty("VideoLink")?.GetValue(item, null);
                    video.Add(new KeyValuePair<string, string>("player" + videoCount, videoLink.ToString()));
                    videoCount++;
                }
            }

        }
    }
}