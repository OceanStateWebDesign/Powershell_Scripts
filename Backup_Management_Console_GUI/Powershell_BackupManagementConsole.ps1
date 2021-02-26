#Backup Management Console - Built by: OceanStateWebDesign.com



Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#region begin GUI{ 

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '777,444'
$Form.text                       = "OWD - BMC"
$Form.TopMost                    = $false


$TicketLabel                     = New-Object system.Windows.Forms.Label
$TicketLabel.text                = "Your Business Backups Control Panel"
$TicketLabel.AutoSize            = $true
$TicketLabel.width               = 25
$TicketLabel.height              = 10
$TicketLabel.location            = New-Object System.Drawing.Point(250,10)
$TicketLabel.Font                = 'Microsoft Sans Serif,13'

$Form.Controls.Add($TicketLabel)

#Button 00

$Button0                 = New-Object system.Windows.Forms.Button
$Button0.text            = "Edit Bkp Target"
$Button0.width           = 105
$Button0.height          = 35
$Button0.location        = New-Object System.Drawing.Point(500,55)
$Button0.Font            = 'Microsoft Sans Serif,10'
$Form.Controls.Add($Button0)

#Button 01

$Button1                 = New-Object system.Windows.Forms.Button
$Button1.text            = "Edit Bkp Paths"
$Button1.width           = 105
$Button1.height          = 35
$Button1.location        = New-Object System.Drawing.Point(350,55)
$Button1.Font            = 'Microsoft Sans Serif,10'
$Form.Controls.Add($Button1)

#Button 02

$Button2                 = New-Object system.Windows.Forms.Button
$Button2.text            = "Manual Data Bkp"
$Button2.width           = 105
$Button2.height          = 35
$Button2.location        = New-Object System.Drawing.Point(200,55)
$Button2.Font            = 'Microsoft Sans Serif,10'
$Form.Controls.Add($Button2)

#Button 03

$Button3                 = New-Object system.Windows.Forms.Button
$Button3.text            = "Manual DB Bkp"
$Button3.width           = 105
$Button3.height          = 35
$Button3.location        = New-Object System.Drawing.Point(50,55)
$Button3.Font            = 'Microsoft Sans Serif,10'
$Form.Controls.Add($Button3)


#Button 00 Action

$Button0.Add_Click(
{
 

edittarget;


})

#Button 01 Action

$Button1.Add_Click(
{
 

editpaths;


})

#Button 02 Action

$Button2.Add_Click(
{


manualdatabkp;

[System.Windows.Forms.MessageBox]::Show("Manual Data Backup Complete.")

})

#Button 03 Action

$Button3.Add_Click(
{


dbdump;

})


function edittarget(){

notepad './bkptarget.txt';

}

function editpaths(){

notepad './datapaths.txt';

}

# Button 02 Function 
function manualdatabkp {



foreach($line in [System.IO.File]::ReadLines(".\datapaths.txt"))
{

        $destinationRoot = Get-Content .\bkptarget.txt
        Copy-Item -Path $line -Recurse -Destination $destinationRoot -Container
}

}


#Button 3 Function
function dbdump {

$dbtarget = "C:/Users/RogerAdmin/Desktop/DB_Bkp.sql"

mysqldump -u dbuser --password 'PasswordHere' databasename localhost > $dbtarget;


}


$Label03                     = New-Object system.Windows.Forms.Label
$Label03.text                = "Directories Included in Backups:"
$Label03.AutoSize            = $true
$Label03.width               = 25
$Label03.height              = 10
$Label03.location            = New-Object System.Drawing.Point(45,110)
$Label03.Font                = 'Microsoft Sans Serif,10'

$Form.Controls.Add($Label03)

$textbox03                       = New-Object system.Windows.Forms.TextBox
$textbox03.multiline                = $true
$textbox03.width                    = 600
$textbox03.height                   = 123
$textbox03.location                 = New-Object System.Drawing.Point(45,135)
$textbox03.Font                     = 'Microsoft Sans Serif,10'
$textbox03.Lines = Get-Content ./datapaths.txt | Out-String

$Form.Controls.Add($textbox03)

$Label04                     = New-Object system.Windows.Forms.Label
$Label04.text                = "Backup Target Path:"
$Label04.AutoSize            = $true
$Label04.width               = 25
$Label04.height              = 10
$Label04.location            = New-Object System.Drawing.Point(45,275)
$Label04.Font                = 'Microsoft Sans Serif,10'

$Form.Controls.Add($Label04)

$textbox04                       = New-Object system.Windows.Forms.TextBox
$textbox04.multiline                = $true
$textbox04.width                    = 600
$textbox04.height                   = 123
$textbox04.location                 = New-Object System.Drawing.Point(45,300)
$textbox04.Font                     = 'Microsoft Sans Serif,10'
$textbox04.Lines = Get-Content ./bkptarget.txt | Out-String

$Form.Controls.Add($textbox04)




[void] $Form.ShowDialog()  
