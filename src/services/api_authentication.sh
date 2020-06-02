function get_api_authentication_json()
{
    local RESPONSE=$(curl -sS -k \
        ${URL}/synth/current/113128/monitor/481388/\?callback\=parseJsonpResponse\&fields\=info\;cur)
    RESPONSE=$(echo $RESPONSE | sed "s|parseJsonpResponse(||g")
    RESPONSE=$(echo "${RESPONSE::-1}")
    echo $RESPONSE;
}

function get_api_authentication_status()
{
    get_status get_api_authentication_json
}
