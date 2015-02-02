function fix-permissions -d "Fix serenity group permissions"

  sudo chgrp -R serenity /serenity
  sudo chmod -R g+w /serenity
  crow success "Make sure all files /serenity have group serenity and group-permission to write"

end
