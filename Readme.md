# Arweave miner UI experiments
## Requirements

    # node 16 (or higher)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    source ~/.bashrc
    nvm i 16
    npm i -g iced-coffee-script pnpm
    
    # some global stuff
    npm i -g iced-coffee-script pnpm
    
    # clone this repo and install deps
    clone https://github.com/virdpool/ar_miner_ui_playground
    cd ar_miner_ui_playground
    pnpm i

## Launch as web app

    npm run front_dev

## Build electron app

    npm run electron:build
    # result: electron_build/ar_miner_ui_playground
    # launch without building
    npm run electron:start
