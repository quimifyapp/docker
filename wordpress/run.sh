docker image build -t wordpress-image .
docker run --name wordpress-container --link mysql-container:mysql -p 8000:80 -v wordpress-volume:/var/www/html --net quimify-network --restart unless-stopped -d wordpress-image
docker logs wordpress-container -f
