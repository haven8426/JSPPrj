function openDocClick()
{
	window.frames[0].location.href = "http://www.newlecture.com";
}
function init() {
	
	var openDoc = document.getElementById("open-href");
	openDoc.onclick = openDocClick;
}
window.onload = init;