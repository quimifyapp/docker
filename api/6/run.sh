docker image build -t api-6-image .
docker container run -d -p 8086:8086 --restart unless-stopped --net quimify-network --name api-6-container api-6-image
docker logs api-6-container -f
