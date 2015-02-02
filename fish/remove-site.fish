function remove_site -a name -d "Remove website and archive its data"

   switch "$name"
    case ""
      crow error "Usage: remove_site <site-name>"
    case '*'
      if test -d /serenity/projects/$name 
        read -p "crow error 'Are you sure you want to archive and remove this website? (y/N)'" ans
        switch "$ans" 
          case "y" "Y"

           archive_site $name

            crow notice "Removing website folder"
            rm /serenity/projects/$name -R
            rweb

            crow success "Site has been destroyed"
          case "" '*'
            crow notice "Site has not been destroyed"
        end
      end
   end
 

end
