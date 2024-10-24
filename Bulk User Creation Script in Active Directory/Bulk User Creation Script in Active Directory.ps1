$securepassword = ConvertTo-SecureString "Password1" -AsPlainText -Force
$userslist = @(
    @{
        Name = "Elliot Alderson"
        GivenName = "Elliot"
        SurName = "Alderson"
        DisplayName = "Elliot Alderson"
        SamAccountName = "elliot.alderson"
        UserprincipalName = "elliot.alderson@reldinG.local"
        Description = "Domain User"
        Path = "OU=USER'S,OU=RELDING.LOCAL,DC=relding,DC=local"
        Title = "Cloud Engineer"
        EmailAddress = "elliot.alderson@reldinG.localm"
        Company = "Ecorp"
        City = "New York"
        StreetAddress = "94 Lyme St.Staten Island, NY 10314"
        Country = "US"
        GroupName = @("VPN USER'S","RELDING ALL GROUPS")
    },
    @{
        Name = "Tyrell Wellick"
        GivenName = "Tyrell"
        SurName = "Wellick"
        DisplayName = "Tyrell  Wellick"
        SamAccountName = "Tyrell .wellick"
        UserprincipalName = "Tyrell .wellick@reldinG.local"
        Description = "Domain User"
        Path = "OU=USER'S,OU=RELDING.LOCAL,DC=relding,DC=local"
        Title = "Cloud Engineer"
        EmailAddress = "Tyrell .wellick@reldinG.local"
        Company = "Ecorp"
        City = "New York"
        StreetAddress = "94 Lyme St.Staten Island, NY 10314"
        Country = "US"
        GroupName = @("VPN USER'S","RELDING ALL GROUPS")
    }
)

foreach ($u in $userslist) {
    # Yeni kullanıcı oluşturma cmdletleri
    New-ADUser -SamAccountName $u.SamAccountName -UserPrincipalName $u.UserprincipalName -Name $u.Name -DisplayName $u.DisplayName -Description $u.Description -Path $u.Path -AccountPassword $securepassword -PasswordNeverExpires $true -Enabled $true -Title $u.Title -EmailAddress $u.EmailAddress -Company $u.Company -City $u.City -GivenName $u.GivenName -Surname $u.SurName -Country $u.Country -StreetAddress $u.StreetAddress
    

    foreach ($group in $u.GroupName){
    Add-ADGroupMember -Identity $group -Members $u.SamAccountName
    }
    Write-Host "Kullanıcı Başarılı Bir Şekilde Oluşturuldu." $u.name
}



