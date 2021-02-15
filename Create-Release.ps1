Param([string] $publish, [string] $tag)

echo "publish = $publish"
echo "tag = $tag"
$root = Get-Location

$assets = @()

if ($tag -like 'v*-*') {
    $assets += '-p'
}

Get-ChildItem -Path $publish -Directory |
ForEach-Object {
    $target = $_.Name
    $dest = "$publish/$target"
    $ext = ""
    if ($_ -like '*win-*') {
        $ext = ".zip"
        Compress-Archive -Path $dest -DestinationPath $dest$ext
    }
    else {
        $ext = ".tar.gz"
        Set-Location $publish
        tar -zcvf $target$ext "$target"
        Set-Location $root
    }
    $assets += "-a $dest$ext"
}

hub release create $( $assets -join ' ' ) -m $tag $tag