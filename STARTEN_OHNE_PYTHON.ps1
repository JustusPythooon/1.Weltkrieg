$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$prefix = "http://127.0.0.1:8765/"
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add($prefix)
try {
    $listener.Start()
    Start-Process ($prefix + "index.html")
    Write-Host "Projekt ZEITRISS laeuft auf $prefix" -ForegroundColor Green
    Write-Host "Dieses Fenster muss waehrend des Spielens offen bleiben." -ForegroundColor Yellow
    Write-Host "Zum Beenden Strg+C druecken." -ForegroundColor Yellow
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $path = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart('/'))
        if ([string]::IsNullOrWhiteSpace($path)) { $path = "index.html" }
        $file = Join-Path $root $path
        $resolvedRoot = [IO.Path]::GetFullPath($root)
        $resolvedFile = [IO.Path]::GetFullPath($file)
        if (-not $resolvedFile.StartsWith($resolvedRoot) -or -not (Test-Path $resolvedFile -PathType Leaf)) {
            $context.Response.StatusCode = 404
            $bytes = [Text.Encoding]::UTF8.GetBytes("Datei nicht gefunden")
        } else {
            $ext = [IO.Path]::GetExtension($resolvedFile).ToLowerInvariant()
            $types = @{ ".html"="text/html; charset=utf-8"; ".js"="text/javascript; charset=utf-8"; ".css"="text/css; charset=utf-8"; ".png"="image/png"; ".jpg"="image/jpeg"; ".jpeg"="image/jpeg"; ".json"="application/json; charset=utf-8"; ".svg"="image/svg+xml" }
            $context.Response.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
            $bytes = [IO.File]::ReadAllBytes($resolvedFile)
            $context.Response.StatusCode = 200
        }
        $context.Response.ContentLength64 = $bytes.Length
        $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        $context.Response.OutputStream.Close()
    }
} finally {
    if ($listener.IsListening) { $listener.Stop() }
    $listener.Close()
}
