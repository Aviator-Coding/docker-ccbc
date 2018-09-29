# CryptoCashBack Coin - Wallet
## Dockercontainer for CryptoCashBack Coin Wallet

Run Container:
>```docker run --name ccbc-masternode-01 --restart=always -d --net mn_net -p xxx.xxx.xxx.xxx:1947:1947 -p xxx.xxx.xxx.xx:1948:1948  -v /masternode/ccbc_01/.ccbc:/root/.ccbc aviator86/ccbc-docker```

> /masternode/ccbc_01/.ccbc - is the location where you store your config on the host  
--name  ccbc-masternode-01 - is the tag which will show up in the Container list name it whatever you want

Stoping Container:
>```docker stop ccbc-masternode-01```

Restart Container:
>```docker restart ccbc-masternode-01```

Start Container:
>```docker start ccbc-masternode-01```

Delete Container: Need to stop Container First
>```docker rm ccbc-masternode-01```

See Container Logs:
>```docker logs ccbc-masternode-01```

## Wallet Status inside Container
See ccbc Chain Status:
>```docker exec -it ccbc-masternode-01 ccbc-cli getinfo```

See ccbc Chain Masternode Status:
>```docker exec -it ccbc-masternode-01 ccbc-cli masternode status```