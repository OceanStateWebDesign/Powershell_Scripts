function Send_Email ()
{

$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$Username = "yourgmail@gmail.com"
$Password = "yourpassword"

$to = "sendto@gmail.com"
$cc = ""
$subject = "Powershell Email"
$body = "Test Message for Powershell"
$attachment = $Path

$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = $body
$message.to.add($to)
$message.cc.add($cc)
$message.from = $username
$message.attachments.add($Path)

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)


}

Send_Email