$pathToRoundhouseExe = ".\rh.exe"
$databaseInstance = "."
$databaseName = "MySqlCiCdExampleDatabase"
$schemaDirectory = "..\SQL"
$versionFile = "..\SQL\version.txt"

$cmd = "& $pathToRoundhouseExe /s=$databaseInstance /d=$databaseName /vf=$versionFile /f=$schemaDirectory"
Invoke-Expression $cmd
