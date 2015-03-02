var page = 1;

function NoticeDao(){
	
}

NoticeDao.prototype = {
		getNotices : function(page, callback){
			var oReq = new XMLHttpRequest();
			   if (oReq) {
				   
				   	 oReq.onreadystatechange = function(){
				   		 if(oReq.readyState == 4)
				   		 {
				   			var data = eval(oReq.responseText);
						     callback(data);
				   		 }
				   		
				   	 }
				      oReq.open("GET", "data.jsp?="+page, true);
				      oReq.send();
			   } 
		}
};
var noticeDao = new NoticeDao();
noticeDao.getNotices(page, function(data){
	alert(data[0].title);
	alert(data[1].title);
});



/*function Exam() {
	this.kor = 0;
	this.eng = 0;
	this.math = 0;
}

Exam.prototype = {
	
	total : function() {
		this.cnt++;
		return this.kor + this.eng + this.math;
	},
	avg : function() {
		return this.total() / 3;
	}
}
var ex1 = new Exam();
ex1.kor = 30;
ex1.eng = 40;
ex1.math = 50;
ex1.total();
//alert(ex1.total());
alert(ex1.cnt);

var ex2 = new Exam();
alert(ex1.cnt);

var ex3 = new Exam();
alert(ex1.cnt);*/