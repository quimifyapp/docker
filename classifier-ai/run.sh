docker image build -t classifier-ai-image .
docker run -d --name classifier-ai-container -p 8070:8070 --net quimify-network --restart unless-stopped -d classifier-ai-image
docker logs classifier-ai-container -f
