#load the shell dotfiles
for file in ~/.{functions,bash_prompt,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if command_exists docker-machine ; then
  eval "$(docker-machine env dev)"
fi

# rbenv
if command_exists rbenv ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
