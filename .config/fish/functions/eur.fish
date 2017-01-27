function eur -d "from eur to other"
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=eur&to=uah" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=eur&to=usd" |  sed '/res/!d;s/<[^>]*>//g';
    wget -qO- "http://www.google.com/finance/converter?a=$argv[1]&from=eur&to=rub" |  sed '/res/!d;s/<[^>]*>//g';
end