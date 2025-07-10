#Test File Location
$file1 = "C:\ClusterStorage\Volume1\downtest.txt"

#Check for Existence of File  
$file1Exists = Test-Path $file1

#Email Settings  
$emailFrom = "Insert email address"  
$emailTo = "Insert email address" 
$subject = "Hyper-V iSCSi Down"
$body = "Connectivity test to Nimble failed. Logon to HyperVisor, open Failover Cluster, open storage, disks, bring nimble online:\`r\`n"
$smtpServer = "Insert SMTP server address"
$smtp = new-object Net.Mail.SmtpClient($smtpServer)

If ($file1Exists)  
{
echo iSCSi is up!
  #Do Nothing  
}  
Else   
{
  #Generate Text for Email Body  
  If (-not $file1Exists) {  
    $body += "\`r\`n" + $file1 + " ."
  }  
  
  #Send Email  
  $smtp.Send($emailFrom, $emailTo, $subject, $body)

  #Throw Exception to Terminate Job  
  throw "iSCSi Connection down on HyperVisor"

}