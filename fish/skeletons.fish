function skeletons -a skel -d "Install skeletons to the current site"
  switch "$skel"
  case ''
    crow error 'Usage: skeletons <skel1> <skel2> .. <skelN>'
  case '*' 
    if gosite
       for sk in $argv
         if test -d "/serenity/skeletons/$sk"
           eval ( echo -s 'cp -R ' '/serenity/skeletons/' $sk '/*' ' .' )
         else
           crow error "Skeletons <$sk> not found"
         end
       end
    end
  end

end
