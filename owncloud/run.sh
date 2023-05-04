docker image build -t owncloud-image .
docker run -d --name owncloud-container -p 8080:8080 --net quimify-network -v owncloud-volume:/mnt/data --restart unless-stopped -d owncloud-image
docker logs owncloud-container -f
