# !/bin/bash

git clone https://github.com/cjplatten/ce-load-balancing-node-api-take-2-2.git
cd ce-load-balancing-node-api-take-2-2/app/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash # installs the node version manager
. ~/.nvm/nvm.sh # sets up the link so we can use nvm command
nvm install --lts # installs the latest version of NodeJS and the accompanying Node Package Manager for that version
npm i 
npm install pm2@latest -g

pm2 start npm -- run start


