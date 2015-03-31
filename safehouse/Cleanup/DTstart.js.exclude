function Popup()
{
   
var WinSettings = "center:yes;resizable:no;dialogHeight:400px";

//var MyArgs = window.showModalDialog("http://inet2/processtech/downtime3.0/Childform.aspx", MyArgs, WinSettings);
var MyArgs = window.showModalDialog("http://localhost:2858/Downtime2.0/FrontEnd/popDTstart.aspx", MyArgs, WinSettings);

// at this point you are waiting on a return from the modal dialog to carry on with the execution

var ref = document.getElementById ("ctl00_ContentPlaceHolder1_txtTime")
ref.value=MyArgs[1].toString();

var ref = document.getElementById ("ctl00_ContentPlaceHolder1_txtUser")
ref.value=MyArgs[0].toString();


}
