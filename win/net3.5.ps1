# 简洁版：下载并执行远程 CMD 脚本
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# 要执行的远程 CMD 脚本地址
$url = 'http://app.2091k.cn/win/net3.5.cmd'

try {
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing
} catch {
    Write-Host "下载失败：$url" -ForegroundColor Red
    return
}

# 保存为临时文件
$tempPath = "$env:TEMP\run_temp.cmd"
$response.Content | Out-File -FilePath $tempPath -Encoding ASCII

# 执行 CMD 脚本
Start-Process "cmd.exe" -ArgumentList "/c `"$tempPath`"" -Wait

# 清理
Remove-Item $tempPath -ErrorAction SilentlyContinue
