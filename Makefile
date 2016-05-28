CONTAINER_NAME=mysql
IMAGE_NAME=bdereims/armhf-mysql-phpmyadmin
VOLUME=/mnt/gv-01/Volumes/mysql

build: Dockerfile
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -p 3306:3306 -p 8081:80 -v $(VOLUME):/var/lib/mysql --name $(CONTAINER_NAME) $(IMAGE_NAME) 

stop:
	docker stop $(CONTAINER_NAME) 
	docker rm $(CONTAINER_NAME) 

clean: 
	docker rmi $(IMAGE_NAME) 

clean-volume:
	rm -fr $(VOLUME)/{*,.??*}
