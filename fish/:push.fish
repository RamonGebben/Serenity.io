function :push -a branch
   switch "$branch"
    case ""
 	say "uuf push it"; say "push it real good"
	git push origin master
    case '*'
    	 say "uuf push it"; say "push it real good"
    	 git push origin $branch
    end
end
