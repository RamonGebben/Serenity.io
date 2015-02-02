function get-routes
  touch /serenity/routes.md
  cat /dev/null > /serenity/routes.md

  echo "##### Development"  >> /serenity/routes.md
  cat /serenity/projects/*/config/nginx.conf >> /serenity/routes.md

  echo "######### Production" >> /serenity/routes.md
  cat /serenity/production/*/config/production.conf >> /serenity/routes.md
  crow notice "Updated routes.md"

  echo "######### Development"
  more /serenity/projects/*/config/nginx.conf 
  echo "######### Production"
  more /serenity/production/*/config/production.conf 
  crow notice "You can acces this log when you like in /serenity/routes.md"
end

