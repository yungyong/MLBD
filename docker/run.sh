docker run \
	--hostname=quickstart.cloudera \
	--privileged=true \
	-t -i \
	--publish-all=true \
	-p 8889:8888 \
	-p 9998:9999 \
	-p 8089:8088 \
	-p 7181:7180 \
	-p 8000:80 \
	-v $(pwd)/..:/workspace \
	ishugaepov/mlbd_spark2 \
	/usr/bin/docker-quickstart
