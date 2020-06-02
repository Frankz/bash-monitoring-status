function get_status()
{
    local STATUS=$($1 | jq .result[0].cur.status )
    #local STATUS=3
    case $STATUS in
        "0")
            STATUS="\e[32mService is operating normally\e[0m";
            ;;
        "1")
            STATUS="\e[33mPerformance issues\e[0m";
            ;;
        "2")
            STATUS="\e[31mService disruption\e[0m";
            ;;
        *)
            STATUS="STATUS $STATUS Unknown!!";
            ;;
    esac
    
    echo -e $STATUS
}