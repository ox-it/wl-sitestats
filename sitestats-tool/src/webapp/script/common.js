
function setMainFrameHeightNoScroll(id){
	setMainFrameHeightNoScroll(id, 0, 0);
}

function setMainFrameHeightNoScroll(id, minHeight)
{
	setMainFrameHeightNoScroll(id, minHeight, 0);
}

function setMainFrameHeightNoScroll(id, minHeight, additionalHeight)
{

	// run the script only if this window's name matches the id parameter
	// this tells us that the iframe in parent by the name of 'id' is the one who spawned us
	if (typeof window.name != "undefined" && id != window.name) return;
	if (!id) return;

	var frame = parent.document.getElementById(id);
	if (frame)
	{
	// reset the scroll
	//parent.window.scrollTo(0,0);

	var objToResize = (frame.style) ? frame.style : frame;
	// alert("After objToResize");

	var height;

	var scrollH = document.body.scrollHeight;
	var offsetH = document.body.offsetHeight;
	var clientH = document.body.clientHeight;
	var innerDocScrollH = null;

	if (typeof(frame.contentDocument) != 'undefined' || typeof(frame.contentWindow) != 'undefined')
	{
	// very special way to get the height from IE on Windows!
	// note that the above special way of testing for undefined variables is necessary for older browsers
	// (IE 5.5 Mac) to not choke on the undefined variables.
	var innerDoc = (frame.contentDocument) ? frame.contentDocument : frame.contentWindow.document;
	innerDocScrollH = (innerDoc != null) ? innerDoc.body.scrollHeight : null;
	}

	// alert("After innerDocScrollH");

	if (document.all && innerDocScrollH != null)
	{
	// IE on Windows only
	height = innerDocScrollH;
	}
	else
	{
	// every other browser!
	height = offsetH;
	}

	// here we fudge to get a little bigger
	//gsilver: changing this from 50 to 10, and adding extra bottom padding to the portletBody
	var newHeight = height + 15;
	
	// Force minimum height if specified
	if(minHeight != 0 && newHeight < minHeight){
		newHeight = minHeight;
	}
	
	// Add additional height if specified
	if(additionalHeight && additionalHeight != 0) {
		newHeight = newHeight + additionalHeight;
	}

	// no need to be smaller than...
	objToResize.height=newHeight  + 5 + "px";

	//var s = " scrollH: " + scrollH + " offsetH: " + offsetH + " clientH: " + clientH + " innerDocScrollH: " + innerDocScrollH + " Read height: " + height + " Set height to: " + newHeight;
	// window.status = s;
	// alert(s);
	}

}