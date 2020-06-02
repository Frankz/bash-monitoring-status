function get_platform_json()
{
    local RESPONSE=$(curl -sS -k \
        ${URL}/synth/current/113128/monitor/475598/\?callback\=parseJsonpResponse\&fields\=info\;cur)
    RESPONSE=$(echo $RESPONSE | sed "s|parseJsonpResponse(||g")
    RESPONSE=$(echo "${RESPONSE::-1}")
    echo $RESPONSE;
}

function get_platform_status()
{
    get_status get_platform_json
}
