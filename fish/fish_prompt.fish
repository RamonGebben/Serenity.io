function fish_prompt
  echo

  set_color -b 222 d91161
  echo -n $USER

  set_color 666
  echo -n "@"

  set_color cyan
  echo -n (hostname)

  set_color 666
  echo -n ":"

  set_color green
  echo -n $PWD

  set_color -b normal 444
  echo -n "     "
  echo -n -s (date +%H:%M) " "
  set_color -b normal 222
  echo -n -s (date +%b ) " " (date +%d)

  set_color -b normal green
  echo -n  (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/')

  echo ""
  io_feed here

  set_color -b normal yellow
  echo -n '» '
  set_color normal




end
