docker image build -t api-4-image .
docker container run -d -p 8084:8084 --restart unless-stopped --net quimify-network --name api-4-container api-4-image
docker logs api-4-container -f
