```
docker build -t test .
docker service create --stop-grace-period=30s -p 80:80 --name=test test
docker service scale test=4
```

wait for services to be up and running

On one side:
```
siege <yourAddress>
```

On another side:
```
docker service logs -f test |grep -v 200
```

On another side:
```
docker service scale test=1
```

On another side:
```
ip netns exec ingress_sbox ipvsadm --list
```
Repeat until service get killed.  

This shows IPVS rules are not removed until containers are stopped.

