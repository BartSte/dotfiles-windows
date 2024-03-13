function Admin-Check
{
    if (!(Verify-Elevated))
    {
        Write-Host 'You need to be an Admin to run this script.'
        exit
    }
}

function Verify-Elevated
{
    # Get the ID and security principal of the current user account
    $myIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $myPrincipal=new-object System.Security.Principal.WindowsPrincipal($myIdentity)
    # Check to see if we are currently running "as Administrator"
    return $myPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Set-WSL-HOME() 
{
    $Env:LH=$(arch run echo -E '$(wslpath -w ~)') # WSL home (Linux Home)
}

