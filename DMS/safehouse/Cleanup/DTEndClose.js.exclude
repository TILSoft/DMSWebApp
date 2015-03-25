       
   //    window.addEventListener('load', Onload());
     
       var prm = Sys.WebForms.PageRequestManager.getInstance();
       prm.add_initializeRequest(InitRequest);
       // try to add an postback on teh page load event using a page load event handler thingy
       
       function InitRequest(sender, args)
       {
       alert("fire")
       __doPostBack();
       }
     
       var prm = Sys.WebForms.PageRequestManager.getInstance();
       prm.add_endRequest(EndRequest);
     
       function EndRequest(sender, args)
            {    
            var UserTech = document.getElementById("ctl00$ContentPlaceHolder1$txtTechUserID")
            var UserEng = document.getElementById("ctl00$ContentPlaceHolder1$txtEngUserID")
            var UserExec = document.getElementById("ctl00$ContentPlaceHolder1$txtExecUserID")
            var time = document.getElementById("ctl00$ContentPlaceHolder1$TxtTime")
            var MyArgs = new Array(time.value,UserTech.value,UserEng.value,UserExec.value);
            window.returnValue = MyArgs; 
            window.close();
            }
                        
           
       function Onload()
         {
        
         }
         
                                  
           