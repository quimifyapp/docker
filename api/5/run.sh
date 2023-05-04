docker image build -t api-5-image .
docker container run -d -p 8085:8085 --restart unless-stopped --net quimify-network --name api-5-container api-5-image
docker logs api-5-container -f
