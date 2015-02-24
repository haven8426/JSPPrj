function btnResizeClick() {
	opener.resizeTo(100,100);
}
function btnMoveClick() {
	opener.moveTo(50, 50);
}
function btnOpenerClick() {
	opener.close();
}
function init() {
	var btnResize = document.getElementById("btn-resize");
	var btnMove = document.getElementById("btn-move");
	var btnOpener = document.getElementById("btn-opener-close");

	btnResize.onclick = btnResizeClick;
	btnMove.onclick = btnMoveClick;
	btnOpener.onclick = btnOpenerClick;
}
window.onload = init;