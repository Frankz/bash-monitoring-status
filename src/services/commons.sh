function get_status()
{
    local STATUS=$($1 | jq .result[0].cur.status )
    case $STATUS in
        "0")
            STATUS="\e[32mService is operating normally\e[0m";
            ;;
        "1")
            STATUS="\e[33mPerformance issues\e[0m";
            send_telegram_notification "$(echo $1 | sed 's|get_||g' | sed 's|_json||g') - $2 - Performance issues"
            ;;
        "2")
            STATUS="\e[31mService disruption\e[0m";
            send_telegram_notification "$(echo $1 | sed 's|get_||g' | sed 's|_json||g') - $2 - Service disruption"
            ;;
        *)
            STATUS="STATUS $STATUS Unknown!!";
            send_telegram_notification "$(echo $1 | sed 's|get_||g' | sed 's|_json||g') - $2 - STATUS $STATUS Unknown!!"
            ;;
    esac
    
    echo -e $STATUS
}

function send_telegram_notification()
{
    curl -sS \
         -o /dev/null \
         -f \
         -k \
         -X POST https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage \
         -d chat_id=${TELEGRAM_CHAT_ID} \
         -d parse_mode=HTML \
         -d text="<i>$(date) </i><pre>$@</pre>"
}