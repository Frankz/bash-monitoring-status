function get_help_center_json()
{
    local RESPONSE=$(curl -sS -k \
        ${URL}/synth/current/113128/monitor/507590/\?callback\=parseJsonpResponse\&fields\=info\;cur)
    RESPONSE=$(echo $RESPONSE | sed "s|parseJsonpResponse(||g")
    RESPONSE=$(echo "${RESPONSE::-1}")
    echo $RESPONSE;
}

function get_help_center_status()
{
    get_status get_help_center_json Veracode
}
