#$orgName="M365x097693"
#$credential = Get-Credential
##Connect-AzureAD -Credential $credential
#Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
#Connect-SPOService -Url https://$orgName-admin.sharepoint.com -credential $credential
#Import-Module SkypeOnlineConnector
##$sfboSession = New-CsOnlineSession -Credential $credential
#Import-PSSession $sfboSession
#$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
#Import-PSSession $exchangeSession -DisableNameChecking
#$SccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication "Basic" -AllowRedirection
#Import-PSSession $SccSession -Prefix cc
Import-Module MicrosoftTeams

#Conexiones
#Connect-MicrosoftTeams -Credential $credential
#cualquier cosa
#Definiciones
$listacursos= "A1","A2","A3"
#Define Curso
$props = @{
    curso = ''
    channel1 = 'Matematicas'
    channel2 = 'Lenguaje'
    channel3 = 'Ciencias'
    Description=''
        }
$objcurso = new-object psobject -Property $props

#Crea Teams Structure
$i=0
while ($i -lt $listacursos.Length )
{
$objcurso.curso=$listacursos[$i]
$objcurso.Description="Espacio de colaboracion de "+$listacursos[$i]
#Write-Output $objcurso.curso
#Write-Output $objcurso.Description
$i+=1
#write-output $i
#Creacion de canales
$team = New-Team -MailNickname  $objcurso.curso -DisplayName $objcurso.curso -Description $objcurso.Description
#$team=Get-Team -GroupId 86d265c2-a867-4b89-abf4-a0c080b24c8c
New-TeamChannel -GroupId $team.GroupId -DisplayName $objcurso.channel1 -Description $objcurso.channel1
New-TeamChannel -GroupId $team.GroupId -DisplayName $objcurso.channel2 -Description $objcurso.channel2
New-TeamChannel -GroupId $team.GroupId -DisplayName $objcurso.channel3 -Description $objcurso.channel3 
}




