function fish_greeting
  rvm use ruby-2.1.0   
  function g2 
    df -h -x tmpfs -x devtmpfs | sed "s/^/  /"
    cd /serenity/projects
    du -sh * | sed "s/^/  /"
  end
  clear
  echo 
  toilet " " (hostname) "" -f smblock  -t -F gay
  g2 | more
end
