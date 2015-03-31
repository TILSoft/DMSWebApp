

// Script to generate an automatic postBack to the server
var secs
var timerID = null
var timerRunning = false
var delay = 1000
function InitializeTimer()
{
    // Set the length of the timer,
    // in seconds. Your choise
    secs = 15

    StopTheClock()
    StartTheTimer()
}
function StopTheClock()
{
    if(timerRunning)
        clearTimeout(timerID)
    timerRunning = false
}
function StartTheTimer()
{
    if (secs==0)
    {
        StopTheClock()

        // Form1.Post1 is a HTML an input button
        // on your Design form. See below.
        Form1.Post1.click()
        //Generate a Postback to the server
        InitializeTimer()
        // Start the timer again
    }
    else
    {
        secs = secs - 1
        timerRunning = true
        timerID = self.setTimeout("StartTheTimer()", delay)
    }
}

