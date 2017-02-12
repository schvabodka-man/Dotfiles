function play -d "play this with emulator"
  set extension (echo "$argv[1]" | perl -n -e '/.+\.(\w+)/ && print "$1\n"') #yes i'm echoing it
  if [ "$extension" = "md" ]
    gens-gs $argv[1]
  else if [ "$extension" = "nes" ]
    fceux $argv[1]
  else
    echo "It seems like it's not a ROM"
  end
end
