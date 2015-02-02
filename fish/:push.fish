function :push -a branch
   switch "$branch"
    case ""
	git push origin master
    case '*'
    	 git push origin $branch
    end
end
