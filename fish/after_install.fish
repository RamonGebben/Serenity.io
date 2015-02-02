function after_install
  cd /serenity
  git pull origin master

  rvm install ruby-2.1.0
  install-nginx
  fix-permissions
  
  crow notice "You are ready to setup the first user"
  crow notice "Use: add_user to add a user"

end
