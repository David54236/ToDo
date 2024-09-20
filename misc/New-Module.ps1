# Variables
$year = (Get-Date).Year
$moduleName = 'ToDo'
$author = 'David Porcher'
$companyName = ''
$description = 'A module to manage your tasks'
$version = '1.0'

# Create the "TestModule" top-level directory
New-Item -ItemType Directory -Name $moduleName

# Create subdirectories
#    TestModule
#    |___ ...
#    |___ ...
#    |___Private
#    |   |___ps1
#    |___ ...

New-Item -Path "$PWD\$moduleName\Private\ps1" -ItemType Directory -Force

# Create subdirectories
#    TestModule
#    |___ ...
#    |___ ...
#    |___ ...
#    |___Public
#        |___ps1

New-Item -Path "$PWD\$moduleName\Public\ps1" -ItemType Directory -Force

# Create the script module
#    TestModule
#    |___ ...
#    |___ TestModule.psm1

New-Item -Path "$PWD\$moduleName\$moduleName.psm1" -ItemType File

# Create the module manifest
#    TestModule
#    |___TestModule.psd1
#    |___ ...

$moduleManifestParameters = @{
    Path = "$PWD\$moduleName\$moduleName.psd1"
    Author = $author
    CompanyName = $companyName
    Copyright = "$year by $author"
    ModuleVersion = $version
    Description = $description
    RootModule = "$moduleName.psm1"
}
New-ModuleManifest @moduleManifestParameters