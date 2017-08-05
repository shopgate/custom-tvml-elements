App.onLaunch = function(options) {
  navigationDocument.pushDocument(createDocument("Custom TVML Elements"));
}

var createDocument = function(title) {
  var documentString = `<?xml version="1.0" encoding="UTF-8" ?>
    <document>
      <alertTemplate>
        <tvce-image style="tvcs-content-mode:'fit'; width:200; height:200;" src="https://media.giphy.com/media/Mvi1ZqG17NSso/giphy.gif" />
				<card style="width:50; height:50;"/>
<tvce-attributedText style="tvcs-font:'Menlo'; font-size:60; color:white; background-color:black; text-align:left; width:1000;">'Menlo'</tvce-attributedText>
				<tvce-attributedText style="tvcs-text-decoration:underline; tvcs-font:'Menlo'; font-size:60; color:white; background-color:gray; text-align:center; width:1000;">Underlined 'Menlo'</tvce-attributedText>
	      <tvce-attributedText style="tvcs-text-decoration:line-through; tvcs-font:'Avenir Next'; font-size:60; color:red; background-color:rgba(255,255,255,.5); text-align:right; width:1000;">Line-through 'Avenir Next'</tvce-attributedText>
				<card style="width:50; height:50;"/>
				<row>
					<tvce-button disabled="true" accessibilityText="Some accessible text" style="tvcs-font:'Futura'; tvcs-content-mode:'fill'; tvcs-background-image-disabled:'https://media.giphy.com/media/CTpUnyZ4G2Cxq/giphy.gif'; tvcs-background-image:'https://s-media-cache-ak0.pinimg.com/736x/76/24/47/762447d9ca0f97b983f056b842209fc3--gradation-color-gradation-design.jpg'; tvcs-background-image-focused:'http://media.giphy.com/media/CvZuv5m5cKl8c/giphy.gif'; tvcs-background-image-highlighted:'https://media.giphy.com/media/i7hNBPBX0a8bC/giphy.gif'; font-size:40; color:white; text-align:center; width:300; height:300; max-width:300;">Disabled Button</tvce-button>
					<card style="width:50; height:50;"/>
					<tvce-button saccessibilityText="Some accessible text" style="tvcs-font:'Futura'; tvcs-content-mode:'stretch'; tvcs-background-image-disabled:'https://media.giphy.com/media/CTpUnyZ4G2Cxq/giphy.gif'; tvcs-background-image-focused:'https://media.giphy.com/media/JXrHZ8yIH2wAE/giphy.gif'; tvcs-background-image-highlighted:'https://media.giphy.com/media/BVStb13YiR5Qs/giphy.gif'; font-size:40; color:white; text-align:center; width:300; height:300; max-width:300;">Hello!</tvce-button>
					<card style="width:50;height:50;"/>
					<tvce-button accessibilityText="Some accessible text" style="tvcs-font:'Futura'; tvcs-content-mode:'fill'; tvcs-background-image-disabled:'https://media.giphy.com/media/CTpUnyZ4G2Cxq/giphy.gif'; tvcs-background-image-focused:'https://media.giphy.com/media/glvyCVWYJ21fq/giphy.gif'; tvcs-background-image-highlighted:'https://media.giphy.com/media/xtc15Nu4ODSQE/giphy.gif'; font-size:40; color:white; text-align:center; width:300; height:300;">Press me!</tvce-button>
				</row>
      </alertTemplate>
    </document>`
    var parser = new DOMParser();
    return parser.parseFromString(documentString, "application/xml");
}
