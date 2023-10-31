function fish_prompt
	if test "$USER" = "vagrant"
		echo -n -s (set_color 22BBCC) [vagrant] " " (prompt_pwd)(set_color normal) (fish_git_prompt) " "
	else
		echo -n -s (set_color $fish_color_cwd --bold) (prompt_pwd)(set_color normal) (fish_git_prompt) " "
	end
end
