Param([string] $publish, [string] $tag)

echo "publish = $publish"
echo "tag = $tag"

Set-Location $publish

$assets = @()

Get-ChildItem -Directory |
ForEach-Object {
    $target = $_.Name
    $ext = ""
    if ($_ -like '*win-*') {
        $ext = ".zip"
        Compress-Archive -Path $target -DestinationPath $target$ext
    }
    else {
        $ext = ".tar.gz"
        tar -zcvf $target$ext $target
    }
    $assets += "./$target$ext"
}

if ($tag -like 'v*-*') {
    $assets += '-p'
}

$options = $assets -join ' '
gh release create $tag $options