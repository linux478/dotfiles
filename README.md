#         d     o     t     f     i     l     e     s
<!-- .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oO -->

## Installation

. Create the directory for the dotfile repository

````
export DOTFILESDIR=${HOME}/.config/dotfiles
````

. Clone the dotfile repository

````
git clone --bare git@github.com:linux478/dotfiles.git ${DOTFILESDIR}
git --git-dir=${DOTFILESDIR} --work-tree=${HOME} checkout

if [ $? = 0 ]; then
  echo "Checked out dot files.";
else
  echo "Backing up pre-existing dot files.";
  git --git-dir=${DOTFILESDIR} --work-tree=${HOME} checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} cp -iv {} {}.org
fi;

git --git-dir=${DOTFILESDIR} --work-tree=${HOME} checkout
````
