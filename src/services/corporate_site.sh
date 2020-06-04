function get_corporate_site_json()
{
    local RESPONSE=$(curl -sS -k \
        ${URL}/synth/current/113128/monitor/475596/\?callback\=parseJsonpResponse\&fields\=info\;cur)
    RESPONSE=$(echo $RESPONSE | sed "s|parseJsonpResponse(||g")
    RESPONSE=$(echo "${RESPONSE::-1}")
    echo $RESPONSE;
}

function get_corporate_site_status()
{
    get_status get_corporate_site_json Veracode
}
