function upgrade -d "Brings core tools and configuration up to date" 

  mkdir -p /serenity/flags
  touch /serenity/flags/first-upgrade

  crow notice "Ensuring tools, logs & sites folder"
  mkdir -p /serenity/tools
  mkdir -p /serenity/logs
  mkdir -p /serenity/projects
  mkdir -p /serenity/source
  mkdir -p /serenity/fishc
  mkdir -p /serenity/skeletons
  mkdir -p /serenity/archive

  crow notice "Pull most recent changes from remote git"
  git pull 

  crow notice "Update fish auto-completitions"
  fish_update_completions 
  
  crow notice "Changing write permissions /serenity*"
  sudo chmod -R g+w /serenity
  
  crow success "Finished upgrade proccess"

end
