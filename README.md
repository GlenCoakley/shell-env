
This is my current set of shell configuration files. They are written for use in any Bourne derived shell which includes: bash and zsh. I believe it includes 'fish' and probably others. 

To get started with this:
  1. Clone the repository. 
  2. Optional: I then rename it to be '.config'. This is a common place for some unix programs to place their configuration files so that one's home directory is not littered with dozens of .* files (dot-files). 
  3. Add the following to the most appropriate start-up file for your shell. If you are not sure what shell you ar using then type the following command: 
```
echo $SHELL
```
    a. If your shell is 'bash' then you probably want to include this in your `~/.bash_profile`.
    b. Placing the commands in other files will likely work but, perhaps, not in all situations.
    c. This assumes the repository directory has been renamed. 

```
export GAC_CFG_DIR=~/.config/gac
source $GAC_CFG_DIR/login.bash
source $GAC_CFG_DIR/work/drc.bash
```

	Note, that the variable GAC_CFG_DIR is used in a few places within some of the startup files. If you want to rename it, you will need to search for all of the uses. If you are renaming things, you may also wish to change 'gac'/'GAC' to something else such as 'mine'.



