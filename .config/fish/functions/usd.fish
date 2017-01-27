function usd -d "from usd to other"
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=usd&to=uah" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=usd&to=eur" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=usd&to=rub" |  sed '/res/!d;s/<[^>]*>//g';
end