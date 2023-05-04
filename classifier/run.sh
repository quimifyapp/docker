docker image build -t classifier-image .
docker run -d --name classifier-container -p 8070:8070 --net quimify-network --restart unless-stopped -d classifier-image
docker logs classifier-container -f
