# intlayer-fix.ps1
# Dynamically determine basePath based on user home, nvm, and Node.js version

# Get user home directory
$userHome = [Environment]::GetFolderPath('UserProfile')

# Get current Node.js version (e.g., v20.18.1)
$nodeVersion = & node -p "process.version"
$nodeVersion = $nodeVersion.Trim()

# Build nvm directory path
if ($IsWindows) {
    $nvmDir = Join-Path $userHome "AppData\Local\nvm\$nodeVersion"
    $basePath = Join-Path $nvmDir "node_modules\@intlayer\mcp\node_modules\@intlayer\docs\legal"
} else {
    $nvmDir = "$userHome/.nvm/versions/node/$nodeVersion"
    $basePath = "$nvmDir/lib/node_modules/@intlayer/mcp/node_modules/@intlayer/docs/legal"
}

$languages = @(
    "en", "en-GB", "en-US", "en-AU", "en-CA", "en-NZ",
    "fr", "fr-CA", "fr-BE", "fr-CH",
    "de", "de-AT", "de-CH", "de-LU",
    "es", "es-MX", "es-ES", "es-AR", "es-CO",
    "pt", "pt-BR", "pt-PT",
    "zh", "zh-CN", "zh-TW", "zh-HK",
    "ar", "ru", "tr", "it", "ja", "ko", "pl", "nl", "sv", "fi", "no", "da", "cs", "el", "he", "id", "ms", "th", "vi", "uk", "ro", "hu", "sk", "bg", "hr", "lt", "lv", "et", "sl", "sr", "ca", "eu", "gl", "mt", "is", "ga", "sq", "bs", "mk", "af", "sw", "zu", "xh", "st", "tn", "ts", "ss", "ve", "nr", "hi"
)

$legalFiles = @(
    "privacy_notice.md",
    "terms_of_service.md",
    "cookie_policy.md",
    "legal_disclaimer.md"
)

foreach ($lang in $languages) {
    $dir = Join-Path $basePath $lang
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
    foreach ($fileName in $legalFiles) {
        $file = Join-Path $dir $fileName
        if (-not (Test-Path $file)) {
            "# Dummy $fileName`nThis is a placeholder for $lang." | Out-File -Encoding utf8 $file
            Write-Host "Created: $file"
        } else {
            Write-Host "Already exists: $file"
        }
    }
}
