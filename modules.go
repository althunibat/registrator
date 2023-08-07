package main

import (
	_ "github.com/althunibat/registrator/consul"
	_ "github.com/althunibat/registrator/consulkv"
	_ "github.com/althunibat/registrator/etcd"
	_ "github.com/althunibat/registrator/skydns2"
	_ "github.com/althunibat/registrator/zookeeper"
)
