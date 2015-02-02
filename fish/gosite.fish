function gosite

  switch $PWD
  case '/serenity/projects/?*'
    cd (echo "puts Dir.pwd.split('/')[0..3].join('/')" | ruby)
    return 0
  case '*'
    crow error "You are not in a site folder (i.e. /serenity/projects/*)"
    return 1
  end

end
