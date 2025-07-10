# Hedef dizin
$basePath = "C:\Users\melih\AppData\Local\nvm\v20.18.1\node_modules\@intlayer\mcp\node_modules\@intlayer\docs\legal"

# Diller ve locale varyantları (gerekirse ekleyebilirsin)
$languages = @(
    "en", "en-GB", "en-US", "en-AU", "en-CA", "en-NZ",
    "fr", "fr-CA", "fr-BE", "fr-CH",
    "de", "de-AT", "de-CH", "de-LU",
    "es", "es-MX", "es-ES", "es-AR", "es-CO",
    "pt", "pt-BR", "pt-PT",
    "zh", "zh-CN", "zh-TW", "zh-HK",
    "ar", "ru", "tr", "it", "ja", "ko", "pl", "nl", "sv", "fi", "no", "da", "cs", "el", "he", "id", "ms", "th", "vi", "uk", "ro", "hu", "sk", "bg", "hr", "lt", "lv", "et", "sl", "sr", "ca", "eu", "gl", "mt", "is", "ga", "sq", "bs", "mk", "af", "sw", "zu", "xh", "st", "tn", "ts", "ss", "ve", "nr", "hi"
)

# Legal dosya isimleri (gerekirse ekleyebilirsin)
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