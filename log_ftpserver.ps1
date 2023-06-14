#디버깅 경로
$debugLogPath = "C:\CF_LOG_TEST\DebugLog.txt"

# 디버깅 로그를 출력하는 함수
function Write-DebugLog {
    param([string]$message)

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"

    # 로그를 파일에 추가
    $logEntry | Out-File -FilePath $debugLogPath -Append

    # 로그를 콘솔에 출력
    Write-Host $logEntr
}

# 압축할 폴더 경로
$folderPath = "C:\CF_LOG_TEST\HSS"

# 압축 파일 경로
$zipFilePath = "C:\CF_LOG_TEST\ftp.zip"

# FTP 서버 정보
$ftpServer = "220.95.208.243"
$ftpUsername = "cf_ph"
$ftpPassword = "c1p$Afr#=5Z3V-#9OS4l"
$ftpRemotePath = "/Upload/08_Logs/SGP/QA/"

# 폴더 압축
Add-Type -A 'System.IO.Compression.FileSystem'
[System.IO.Compression.ZipFile]::CreateFromDirectory($folderPath, $zipFilePath)

# 업로드할 파일 경로
$filePath = "C:\CF_LOG_TEST\ftp_test.zip"

# FTP로 전송
$ftpRequest = [System.Net.FtpWebRequest]::Create("ftp://$ftpServer$ftpRemotePath" + [System.IO.Path]::GetFileName($zipFilePath))
$ftpRequest.Credentials = New-Object System.Net.NetworkCredential($ftpUsername, $ftpPassword)
$ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$ftpRequest.UseBinary = $true

$fileContents = [System.IO.File]::ReadAllBytes($zipFilePath)

# 압축 파일 삭제
#Remove-Item $zipFilePath

Write-Host "파일 전송이 완료되었습니다."

