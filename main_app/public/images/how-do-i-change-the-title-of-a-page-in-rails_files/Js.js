

var populateCareersAd = function () {
	var isJoel = false;
	var adselector = isJoel ? "#job" : ".hireme";
	var ads = $(adselector);
	var adHtml = " \u003cstyle type=\"text/css\"\u003e .hireme { background: #fff url(http://sstatic.net/ads/img/careers-ad-bg-so.png) no-repeat 0 100%; border-top:1px solid #e6e6e6; color: #333; font-family: Arial, Helvetica, sans-serif; font-size:12px; line-height:130%; padding:0; width:220px; } .hireme \u003e p { display:block; clear:both; margin:0; padding:13px; padding-bottom:0; } .hireme \u003e p.hed { margin:0; padding:0; font-weight:bold; } .hireme \u003e p \u003e a { cursor:pointer; text-decoration:none; display:block; margin-left:1px; } .hireme \u003e p.hed \u003e a { font-weight:bold; } .hireme \u003e p.hed \u003e a \u003e img { height:76px; } .hireme \u003e p \u003e a \u003e span.location { color:#666; } .hireme \u003e img.impression { display:none; } .hireme \u003e p.hed img.careers-hed { margin-top:2px; margin-bottom:2px; } .hireme \u003e a#bottomlink { display:block; height:45px; margin:15px 0 15px 0; } \u003c/style\u003e \u003cp class=\"hed\"\u003e \u003ca href=\"http://careers.stackoverflow.com:80/?campaign=PrettyHeader\" id=\"title\" target=\"_blank\"\u003e\u003cimg src=\"http://sstatic.net/ads/img/careers-ad-header-so.png\" alt=\"careers.stackoverflow.com\" class=\"careers-hed\" /\u003e\u003c/a\u003e \u003c/p\u003e \u003cp\u003e \u003ca href=\"http://careers.stackoverflow.com:80/Jobs/8023?campaign=PrettyTopspot\" target=\"_blank\" title=\"High Frequency Linux Systems Engineer at Two Sigma Investments, LLC. Click to learn more.\"\u003e High Frequency Linux Systems Engineer at Two Sigma Investments, LLC \u003cspan class=\"location\"\u003e(New York, NY)\u003c/span\u003e \u003c/a\u003e \u003c/p\u003e \u003cp\u003e \u003ca href=\"http://careers.stackoverflow.com:80/Jobs/7791?campaign=PrettyGeocoded\" target=\"_blank\" title=\"C# .NET Developers at PICT. Click to learn more.\"\u003e C# .NET Developers at PICT \u003cspan class=\"location\"\u003e(Westminster, England)\u003c/span\u003e \u003c/a\u003e \u003c/p\u003e \u003ca href=\"http://careers.stackoverflow.com:80/?campaign=PrettyFooter\" id=\"bottomlink\"\u003e\u003c/a\u003e \u003cimg src=\"http://careers.stackoverflow.com:80/Ad/JobImpression?id=8023&campaign=PrettyTopspot&id=7791&campaign=PrettyGeocoded&id=-1&campaign=PrettyHeader&id=-1&campaign=PrettyFooter\" alt=\"impression\" class=\"impression\" /\u003e ";

	ads.html(adHtml);

	if (isJoel) {
		ads.slideDown("normal");
	}
};

$(document).ready(function () {
	populateCareersAd();
});
