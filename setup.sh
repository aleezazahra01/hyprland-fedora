#symlinks 


mkdir -p ~/.config 
echo "Creating symlinks..."

ln -sf "$PWD/wallpapers" ~/.config/wallpapers

ln -sf "$PWD/scripts" ~/.config/scripts

ln -sf "$PWD/waybar" ~/.config/waybar
ln -sf "$PWD/kitty" ~/.config/kitty
ln -sf "$PWD/wofi" ~/.config/wofi

ln -sf "$PWD/swaylock" ~/.config/swaylock
ln -sf "$PWD/wlogout" ~/.config/wlogout

ln -sf "$PWD/fastfetch" ~/.config/fastfetch

ln -sf "$PWD/hypr" ~/.config/hypr

ln -sf "$PWD/style" ~/.config/style

echo "All symlinks created"
echo "You can now start Hyprland"
