mkdir -p ~/xalu_global
git init ~/xalu_global
cd ~/xalu_global
git remote add -f origin https://github.com/asmfs/xalu.git
git config core.sparseCheckout true
echo "x86_64/coreutils" >> .git/info/sparse-checkout
git pull origin def
printf "\n\n=========================================\n\nxalu utils installed at ~/xalu_global\n\n"
cd ~/xalu_global/x86_64/coreutils
printf "xalu: commands: \n\""
ls
printf "\";\n"
