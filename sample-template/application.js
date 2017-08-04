App.onLaunch = function(options) {
  navigationDocument.pushDocument(createDocument("Custom TVML Elements"));
}

var createDocument = function(title) {
  var documentString = `<?xml version="1.0" encoding="UTF-8" ?>
    <document>
      <alertTemplate>
        <tvce-image style="width: 200; height: 200;" src="https://raw.githubusercontent.com/shopgate/custom-tvml-elements/master/spinner.gif" />
        <tvce-attributedText style="font-size: 60; color: rgba(0,0,0,0.5); text-align:center; width: 1920; height: 100; ">${title}</tvce-attributedText>
        <tvce-attributedText style="tvcs-text-decoration: underline; tvcs-font:'Menlo'; font-size: 60; color: white; background-color: black; text-align:center; width: 1920; height: 100;">Underlined text with font 'Menlo'</tvce-attributedText>
        <tvce-attributedText style="tvcs-text-decoration: line-through; tvcs-font:'Avenir Next'; font-size: 60; color: red; background-color: rgba(255,255,255,.5); text-align:center; width: 1920; height: 100;">Line-through text with font 'Avenir Next'</tvce-attributedText>
				<row>
					<tvce-attributedText style="tvcs-font:'Apple SD Gothic Neo'; font-size: 40; color: green; background-color: rgba(255,255,255,.1); text-align:center; width: 960; height: 100;">Apple SD Gothic Neo</tvce-attributedText>
					<tvce-attributedText style="tvcs-font:'Helvetica Neue'; font-size: 40; color: white; background-color: rgba(0,0,0,.3); text-align:center; width: 960; height: 100;">Helvetica Neue</tvce-attributedText>
				</row>
				<tvce-button style="tvcs-font:'Futura'; tvcs-text-decoration: underline; font-size: 40; color: white; background-color: red; text-align:center; width: 960; height: 100;">Button with Attributed Title</tvce-button>
				<tvce-button style="tvcs-font:'Futura'; tvcs-text-decoration: line-through; font-size: 40; color: black; background-color: rgba(73,255,200,1.0); text-align:center; width: 960; height: 100;">Avenir Next</tvce-button>
      </alertTemplate>
    </document>`
    var parser = new DOMParser();
    return parser.parseFromString(documentString, "application/xml");
}
