function cloud-mount-cifs
	set user (pass cloud/smb/user)
	set pass (pass cloud/smb/pass)
	set shareName (pass cloud/smb/shareName)
	set serverIp (pass cloud/smb/serverAddress)
	set user (whoami)
	sudo mount.cifs //$serverIp/$shareName /home/$user/cloud/ -o user=$user,pass=$pass,uid=$user,iocharset=utf8,file_mode=0777,dir_mode=0777,noperm
end
