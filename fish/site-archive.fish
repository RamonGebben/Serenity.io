function archive_site -a name -d "Archive the website as a timestamped .tar.gz"

    switch "$name"
    case "" 
      crow notice "Usage: archive_site <name>"
    case "*"
      if test -d /serenity/projects/$name 
        crow notice "Backing up website data"
        cd /serenity/projects/$name
        tgz
        mkdir -p /serenity/archive
        mv *.tar.gz /serenity/archive
        cd /serenity/projects
      else
        crow error "Name $name is not a site folder"
        crow notice "Usage: archive_site <name>"
      end
     end

end
