docker image build -t datadog-image .

docker run -d --name datadog-container \
	-e DD_REMOTE_CONFIGURATION_ENABLED=true \
	-e DD_LOGS_ENABLED=true \
    -e DD_SYSTEM_PROBE_NETWORK_ENABLED=true \
    -e DD_PROCESS_AGENT_ENABLED=true \
    -e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
    -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
    -e DD_SITE="us5.datadoghq.com" \
    -e DD_CONTAINER_EXCLUDE_LOGS="name:datadog-container" \
	-v /var/run/docker.sock:/var/run/docker.sock:ro \
	-v /proc/:/host/proc/:ro \
	-v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
	-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
	--security-opt apparmor:unconfined \
    --cap-add=SYS_ADMIN \
    --cap-add=SYS_RESOURCE \
    --cap-add=SYS_PTRACE \
    --cap-add=NET_ADMIN \
    --cap-add=NET_BROADCAST \
    --cap-add=NET_RAW \
    --cap-add=IPC_LOCK \
    --cap-add=CHOWN \
	--restart unless-stopped \
    datadog-image

docker logs datadog-container -f
