if($args.Count -lt 2) {

    Write-Host "A PowerShell script to download a Youtube video containing multiple songs separated with timestamp chapter markers.
    Usage: .\YTADL.ps1 <OUTPUT FOLDER NAME> <YOUTUBE URL>"  
}
else {
    
    $output=$args[0]
    $url=$args[1]

    Write-Host Downloading URL $url to $output

    mkdir $output

    cd $output

    yt-dlp -f bestaudio --split-chapters $url

    Get-ChildItem *.webm -recurse | % { ffmpeg -i $_.FullName -vn -acodec copy ($_.Basename + ".opus") }

    rm *.webm

    Get-ChildItem *.opus -recurse | % { ffmpeg-normalize -lrt 10 --audio-codec mp3 -ar 48000 --audio-bitrate 320K $_.Name }

    cd normalized

    Get-ChildItem *.mkv -recurse | % { ffmpeg -i $_.FullName -vn -acodec copy ($_.Basename + ".mp3") }

    rm *.mkv

}
