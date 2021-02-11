function fish_prompt
	if string match -rq "^/vagrant" $PWD
		echo -n -s (set_color $fish_color_cwd --bold) (prompt_pwd)(set_color normal) " "
	else
		echo -n -s (set_color $fish_color_cwd --bold) (prompt_pwd)(set_color normal) (fish_git_prompt) " "
	end
end
