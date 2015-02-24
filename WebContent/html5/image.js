function textClick() {
	var text = document.getElementById("text1");
	var img1 = document.getElementById("img1");
	img1.src = text.value;
	
}
function styleTypeClick()
{
	var img1 = document.getElementById("img1");
	var styleType = document.getElementById("styleType");
	img1.style.borderWidth = styleType.value;
}

function init() {
	var changeImage = document.getElementById("chang-image");
	var changeStyle = document.getElementById("chang-style");
	changeImage.onclick = textClick;
	changeStyle.onclick = styleTypeClick;
}
window.onload = init;