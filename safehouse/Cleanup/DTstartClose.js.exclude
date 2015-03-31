       
     
       var prm = Sys.WebForms.PageRequestManager.getInstance();
       prm.add_endRequest(EndRequest);
     
       function EndRequest(sender, args)
           {    
            var User = document.getElementById("ctl00$ContentPlaceHolder1$txtUser")
            var time = document.getElementById("ctl00$ContentPlaceHolder1$TxtTime")
            var MyArgs = new Array(User.value,time.value);
            window.returnValue = MyArgs;                 
            window.close();
            }
           
                                   
           