
/*function printResult()
		{
			var x, y;
			var btnPrint = document.getElementById("btn-print");
			x = prompt("x값을 입력하세요",0);
			y = prompt("y값을 입력하세요",0);
			x = parseInt(x);
			y = parseInt(y);
			btnPrint.value = x + y;	
		}
		function init(){
			var btnPrint = document.getElementById("btn-print");
			btnPrint.onclick  =  printResult;
		}
		window.onload = init;*/

	function init()
	{
		var btnSum = document.getElementById("btn-sum");
		btnSum.onclick = btnSumClick;
	}
	
	function btnSumClick()
	{
		var txtX = document.getElementById("text-x").value;
		var txtY = document.getElementById("text-y").value;
		var txtSum = document.getElementById("txt-sum");
		
		txtSum.value = parseInt(txtX)+parseInt(txtY);
	}
	window.onload = init;