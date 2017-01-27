function rur -d "from rur to other"
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=rub&to=usd" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=rub&to=eur" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=rub&to=uah" |  sed '/res/!d;s/<[^>]*>//g';
end