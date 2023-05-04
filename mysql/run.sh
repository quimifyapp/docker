docker image build -t mysql-image .
docker container run -d -p 3306:3306 --restart unless-stopped --net quimify-network -v mysql-volume:/var/lib/mysql --name mysql-container mysql-image
