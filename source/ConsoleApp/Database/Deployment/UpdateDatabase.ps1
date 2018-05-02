$pathToRoundhouseExe = ".\rh.exe"
$databaseServer = "."
$databaseName = "MySqlCiCdExampleDatabase"
$schemaDirectory = "..\SQL"
$versionFile = "..\SQL\version.txt"

$cmd = "& $pathToRoundhouseExe /s=$databaseServer /d=$databaseName /vf=$versionFile /f=$schemaDirectory /withtransaction=true"
Invoke-Expression $cmd
