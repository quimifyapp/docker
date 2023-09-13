docker image build -t datadog-image .

# So it can read RAM usage data: -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \ 
# So it can read RAM usage data: -v /etc/os-release:/host/etc/os-release:ro \  
# Needed for some unknown reason: -v /var/run/docker.sock:/var/run/docker.sock \ 

docker run -d --name datadog-container \
    --restart unless-stopped \
    -v datadog-volume:/var/log/datadog \
    -v datadog-volume:/var/run/s6 \
    -v /proc/:/host/proc/:ro \
    -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
    -v /etc/os-release:/host/etc/os-release:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
	-e DD_REMOTE_CONFIGURATION_ENABLED=true \
	-e DD_LOGS_ENABLED=true \
    -e DD_SYSTEM_PROBE_NETWORK_ENABLED=true \
    -e DD_PROCESS_AGENT_ENABLED=true \
    -e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
    -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
    -e DD_SITE="us5.datadoghq.com" \
    -e DD_CONTAINER_EXCLUDE_LOGS="name:datadog-container" \
    --security-opt apparmor:unconfined \
    --cap-add=SYS_ADMIN \
    --cap-add=SYS_RESOURCE \
    --cap-add=SYS_PTRACE \
    --cap-add=NET_ADMIN \
    --cap-add=NET_BROADCAST \
    --cap-add=NET_RAW \
    --cap-add=IPC_LOCK \
    --cap-add=CHOWN \
    datadog-image

docker logs datadog-container -f

