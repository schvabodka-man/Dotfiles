#!/usr/bin/fish
builtin cd ~/.config/fish/panel/
i3status -c ~/.i3/i3status.conf | while true
  read line
  set todo (./todo.fish)
  set calendar (./calendar.fish)
  set meetups (./meetup.fish)
  set weather (./weather.fish)
  echo "$meetups $calendar $todo $line"
end
