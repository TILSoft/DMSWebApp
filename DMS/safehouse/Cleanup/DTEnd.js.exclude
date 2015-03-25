function Popup()
{

//set the cookie to allow the pop up to know what type of authorisation is required
var authreq = document.getElementById("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_txtAuthReq");
alert(authreq.value)
SetCookie("AuthReq",authreq.value,1);

//Set the window settings for this box
var WinSettings = "center:yes;resizable:no;dialogHeight:500px";

//var MyArgs = window.showModalDialog("http://inet2/processtech/downtime3.0/Childform.aspx", MyArgs, WinSettings);
var MyArgs = window.showModalDialog("http://localhost:2858/Downtime2.0/FrontEnd/popDTend.aspx", MyArgs, WinSettings);


// at this point you are waiting on a return from the modal dialog to carry on with the execution
var txttime = document.getElementById ("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_txtTime")
txttime.value=MyArgs[0].toString();

var txttech= document.getElementById ("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_txtUserTech")
txttech.value=MyArgs[1].toString();

var txtenguser= document.getElementById ("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_txtUserEng")
txtenguser.value=MyArgs[2].toString();

var txtexecuser= document.getElementById ("ctl00_ContentPlaceHolder1_TabContainer1_TabPanel2_txtUserExec")
txtexecuser.value=MyArgs[3].toString();
}

function SetCookie(cookieName,cookieValue,nDays) 
{
 var today = new Date();
 var expire = new Date();
 if (nDays==null || nDays==0) nDays=1;
 
 expire.setTime(today.getTime() + 3600000*24*nDays);
 
 document.cookie = cookieName+"="+escape(cookieValue)
                 + ";expires="+expire.toGMTString();
}
