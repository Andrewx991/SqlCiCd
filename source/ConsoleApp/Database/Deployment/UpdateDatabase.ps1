$pathToRoundhouseExe = ".\rh.exe"
$databaseInstance = "."
$databaseName = "AndrewsCiCdSqlExampleDatabase"
$schemaDirectory = "..\Schema"
$versionFile = "..\Schema\version.txt"

$cmd = "& $pathToRoundhouseExe /s=$databaseInstance /d=$databaseName /vf=$versionFile /f=$schemaDirectory"
Invoke-Expression $cmd
