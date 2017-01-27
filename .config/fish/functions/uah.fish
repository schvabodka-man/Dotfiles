function uah -d "from uah to other"
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=uah&to=usd" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=uah&to=eur" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=uah&to=rub" |  sed '/res/!d;s/<[^>]*>//g';
end