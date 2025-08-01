# 配置安全协议以支持HTTPS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# 目标脚本URL
$targetUrl = 'http://app.2091k.cn/wim/net3.5.cmd'

try {
    # 获取脚本内容
    $response = Invoke-WebRequest -Uri $targetUrl -UseBasicParsing -ErrorAction Stop
}
catch {
    Write-Host "无法获取脚本内容，请检查网络连接" -ForegroundColor Red
    return
}

# 生成临时文件路径
$tempFileName = "MAS_$([Guid]::NewGuid().Guid).cmd"
$tempPath = if ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544') {
    "$env:SystemRoot\Temp\$tempFileName"  # 管理员权限路径
} else {
    "$env:USERPROFILE\AppData\Local\Temp\$tempFileName"  # 普通用户路径
}

# 保存内容到临时CMD文件
try {
    Set-Content -Path $tempPath -Value $response.Content -ErrorAction Stop
}
catch {
    Write-Host "无法创建临时文件" -ForegroundColor Red
    return
}

# 运行CMD脚本
try {
    Start-Process -FilePath $env:ComSpec -ArgumentList "/c ""$tempPath""" -Wait -NoNewWindow
}
finally {
    # 清理临时文件
    if (Test-Path $tempPath) {
        Remove-Item $tempPath -Force
    }
}
