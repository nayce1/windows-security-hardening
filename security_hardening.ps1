# security_hardening.ps1
# 🚀 Windows Security Hardening Script
# Description: Automates security enhancements for Windows

# Enable Windows Defender Firewall
Write-Host "Enabling Windows Defender Firewall..."
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Disable SMBv1 (to prevent WannaCry attacks)
Write-Host "Disabling SMBv1..."
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force

# Enforce strong password policies
Write-Host "Enforcing strong password policies..."
secedit /configure /db c:\windows\security\local.sdb /cfg c:\windows\security\templates\hisecws.inf /overwrite

# Check for missing security updates
Write-Host "Checking for Windows updates..."
Get-WindowsUpdateLog | Out-File C:\Security_Audit_Report.txt

Write-Host "Security hardening complete! Check C:\Security_Audit_Report.txt for details."

