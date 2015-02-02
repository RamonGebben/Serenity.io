function install-nginx -d "Install nginx webserver from source"


  crow notice "Installing passenger"
  gem install passenger
  sudo apt-get -y install libcurl4-openssl-dev 

  crow notice "Turning swap on"
  swap on
  
  crow notice "Building en installing nginx" 
  sudo passenger-install-nginx-module --languages ruby,python,nodejs,meteor --auto-download --extra-configure-flags='"--with-http_ssl_module --with-http_mp4_module"' --auto --prefix=/opt/nginx

  crow notice "Turning swap off"
  swap off

  crow notice "Hooking up nginx as a system-wide service"
  sudo cp /serenity/config/nginx.service /etc/init.d/nginx

  sudo rm -r /opt/nginx/conf
  sudo ln -s /serenity/config/nginx /opt/nginx/conf

  crow notice "Installing rails"
  gem install rails

  crow notice "Adding nginx to default run-levels"
  update-rc.d -f nginx defaults

  crow notice "add good version number of passenger to /serenity/config/nginx/nginx.conf"

end
