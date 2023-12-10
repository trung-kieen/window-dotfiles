echo Credit: https://aaneloy.github.io/Github-SSH-windows-11/
#choco install git -Y
git config --global user.name "kien"
git config --global user.email "trungkiennk4869@gmail.com"
mkdir -p ~/.ssh
cd ~/.ssh/
ssh-keygen -t ed25519 -C "trungkiennk4869@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~\.ssh\id_ed25519
clip    id_ed25519.pub
echo "-------------------COPY THIS----------------"
less   ~\.ssh\id_ed25519.pub
echo "--------------------------------------------"
echo put this to git ssh setting from github and then continue terminal will sleep 60 second
echo access site https://github.com/settings/keys
