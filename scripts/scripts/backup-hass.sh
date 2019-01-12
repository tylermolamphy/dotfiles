cd ~/Hass
rm -rfv config
mkdir config
cd config
rsync -rv "root@10.10.10.42:/config/*" . -e"ssh -i ~/.ssh/id_rsa_hass" --exclude "*.db"
echo `date` >> ~/Hass/config/_timestamp
echo Timestamped
