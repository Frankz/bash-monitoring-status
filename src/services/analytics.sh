function get_analytics_json()
{
    local RESPONSE=$(curl -sS -k \
        ${URL}/synth/current/113128/monitor/510757/\?callback\=parseJsonpResponse\&fields\=info\;cur)
    RESPONSE=$(echo $RESPONSE | sed "s|parseJsonpResponse(||g")
    RESPONSE=$(echo "${RESPONSE::-1}")
    echo $RESPONSE;
}

function get_analytics_status()
{
    get_status get_analytics_json Veracode
}
