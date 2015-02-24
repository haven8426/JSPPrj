function textNodeAdd()
{
	var txt = document.createTextNode("안녕하세요");
	var div1 = document.getElementById("div1");
	div1.appendChild(txt);
}

function imgNodeAdd()
{
	var img1 = document.createElement("img");
	img1.src = "image1.jpg"; 
	var div1 = document.getElementById("div1");
	div1.appendChild(img1);
}

function textNodeDelete()
{
	var div1 = document.getElementById("div1");
	var txtLast = div1.lastChild;
	div1.removeChild(txtLast);
}

function nodeClone()
{
	var div1 = document.getElementById("div1");
	var clone1 = div1.cloneNode(true);
	var target  = document.body;
	target.appendChild(clone1);
}
function init() {
	var textAdd = document.getElementById("text-add");
	var imageAdd = document.getElementById("img-add");
	var textDelete = document.getElementById("text-delete");
	var clone = document.getElementById("node-clone");
	textAdd.onclick = textNodeAdd;
	imageAdd.onclick = imgNodeAdd;
	textDelete.onclick = textNodeDelete;
	clone.onclick = nodeClone;
}
window.onload = init;