sudo useradd -m pablogod
sudo adduser pablogod sudo
echo "pablogod:pabloesgod" | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo hostname $LINUX_MACHINE_NAME

if [[ -z "$NGROK_AUTH_TOKEN" ]]; then
  echo "Please set 'NGROK_AUTH_TOKEN'"
  #exit 2
fi

if [[ -z "$LINUX_USER_PASSWORD" ]]; then
  echo "Please set 'LINUX_USER_PASSWORD' for user: $USER"
  #exit 3
fi
#if [1 -eq 1]; then
: '

  echo "### Install ngrok ###"

  wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
  unzip ngrok-stable-linux-386.zip
  chmod +x ./ngrok

  echo "### Update user: $USER password ###"
  echo -e "$LINUX_USER_PASSWORD\n$LINUX_USER_PASSWORD" | sudo passwd "$USER"

  : ' : '
  echo "### Start ngrok proxy for 22 port ###"


  rm -f .ngrok.log
  ./ngrok authtoken "2Du8f7KkLzellalQrFS6rXQDG20_kB4zZzXGy2Yz6P8B4Faa"
  ./ngrok tcp 22 --log ".ngrok.log" &

  sleep 10
  HAS_ERRORS=$(grep "command failed" < .ngrok.log)

  if [[ -z "$HAS_ERRORS" ]]; then
    echo ""
    echo "=========================================="
    echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
    echo "or conenct with $(grep -o -E "(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh (Your Linux Username)@/" | sed "s/:/ -p /")"
    #curl --silent -o i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"}" https://ptb.discord.com/api/webhooks/1012830182882685140/coAa8BUhkJJc9EHPAanJ2IECPG9Podh7H3J3cBZPF2_sRqQAOKH-HuKEKuqxr6rBInEC
    ngip="To connect ssh: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "" | sed "s/:/ -p /")"
    #ngip="To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
    echo $ngip
    curl -H "Content-Type: application/json" -d '{"username": "test", "content": "'"$ngip"'"}' "https://ptb.discord.com/api/webhooks/1012830182882685140/coAa8BUhkJJc9EHPAanJ2IECPG9Podh7H3J3cBZPF2_sRqQAOKH-HuKEKuqxr6rBInEC"
    echo "=========================================="
  else
    echo "$HAS_ERRORS"
    #curl -H "Content-Type: application/json" -d '{"username": "test", "content": "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"}' "https://ptb.discord.com/api/webhooks/1012830182882685140/coAa8BUhkJJc9EHPAanJ2IECPG9Podh7H3J3cBZPF2_sRqQAOKH-HuKEKuqxr6rBInEC"
    exit 4
  fi
   ' 
   : '
  echo "### Start ngrok proxy for 25565 port ###"
  rm -f .ngrok.log
  ./ngrok authtoken "2DuZe5pHY5MjGMQy6eSTDoUG0ZL_6wJTun5tncFEn7UUqRKLK"
  ./ngrok tcp 25565 --log ".ngrok.log" &

  sleep 10
  HAS_ERRORS=$(grep "command failed" < .ngrok.log)

  if [[ -z "$HAS_ERRORS" ]]; then
    echo ""
    echo "=========================================="
    echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
    echo "or conenct with $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh (Your Linux Username)@/" | sed "s/:/ -p /")"
    ngip="To connect Minecraft: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "" | sed "s/:/ -p /")"
    echo $ngip
    curl -H "Content-Type: application/json" -d '{"username": "test", "content": "'"$ngip"'"}' "https://ptb.discord.com/api/webhooks/1012830182882685140/coAa8BUhkJJc9EHPAanJ2IECPG9Podh7H3J3cBZPF2_sRqQAOKH-HuKEKuqxr6rBInEC"
    echo "=========================================="
  else
    echo "$HAS_ERRORS"
    exit 4
  fi

  echo "### Start ngrok proxy for 8080 port ###"
  rm -f .ngrok.log
  ./ngrok authtoken "2Dwf3xdfkymIkrXP4C92IzKJBNH_6R1CT4Cby2nod58JQWWyh"
  ./ngrok tcp 8080 --log ".ngrok.log" &

  sleep 10
  HAS_ERRORS=$(grep "command failed" < .ngrok.log)

  if [[ -z "$HAS_ERRORS" ]]; then
    echo ""
    echo "=========================================="
    echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
    echo "or conenct with $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh (Your Linux Username)@/" | sed "s/:/ -p /")"
    ngip="To connect Web: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "" | sed "s/:/ -p /")"
    echo $ngip
    curl -H "Content-Type: application/json" -d '{"username": "test", "content": "'"$ngip"'"}' "https://ptb.discord.com/api/webhooks/1012830182882685140/coAa8BUhkJJc9EHPAanJ2IECPG9Podh7H3J3cBZPF2_sRqQAOKH-HuKEKuqxr6rBInEC"
    echo "=========================================="
  else
    echo "$HAS_ERRORS"
    exit 4
  fi
  echo "### ngrok done ###"
#fi
##################3
'
mkdir /etc/playit
mkdir ~/playit
ln -s /etc/playit ~/playit
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | sudo apt-key add -
sudo curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list
sudo apt update
sudo apt install playit

#tmux new-session -d -s my_session 'playit'


curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash
sudo apt-get install pufferpanel
sudo systemctl enable pufferpanel
sudo pufferpanel user add --name PabloGod --email pablogod@gmail.com --password pabloesgod5 --admin

sudo systemctl enable --now pufferpanel


#cd ~/../$LINUX_USERNAME
wget -q https://filebin.net/3wpil766znlkbnw0/eula.txt
wget -q https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/790/downloads/paper-1.16.5-790.jar
#screen -S minecraft
#screen -dm java -Xmx1024M -Xms1024M -jar paper-1.16.5-790.jar screen



#java -jar paper-1.16.5-790.jar
playit