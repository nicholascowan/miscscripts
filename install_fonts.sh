_wgeturl="https://github.com/google/fonts/archive/main.tar.gz"
_gf="google-fonts"
_temp="/workstream/_temp"

echo "Making temp folder"
sudo mkdir -p $_temp
cd $_temp


echo "Connecting to Github server to download fonts..."
wget $_wgeturl -O $_gf.tar.gz

echo "Extracting the downloaded archive..."
tar -zxvf $_gf.tar.gz

echo "Creating the /usr/share/fonts/truetype/$_gf folder"
sudo mkdir -p /usr/share/fonts/truetype/$_gf

echo "Installing all .ttf fonts in /usr/share/fonts/truetype/$_gf"
find $PWD/fonts-main/ -name "*.ttf" -exec sudo install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || echo "An error occured, please run this script again."

echo "Updating the font cache"
fc-cache -f

echo "Done. Now you can delete the tarball file $_gf.tar.gz if you wish."
cd ~

echo "Clearing font cache"
sudo fc-cache -fv
