import os

for i in ["Videos", "Documents", "Downloads", "Builds", "Network", "scripts", "dotfiles", "owncloud", "VMs"]:
    cmd = "ln -s /Data/ryan/" + i + " /home/ryan/" + i
    os.system(cmd)
