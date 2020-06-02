#!/usr/bin/env bash
#set -xe
#########################################
# Globals
#########################################
URL="https://mongocache.asm.ca.com"
WORKDIRECTORY=$(dirname "$(realpath $0)")

#########################################
# Commons
#########################################
source "$WORKDIRECTORY/services/commons.sh"

#########################################
# Import Veracode Analytics
#########################################
source "$WORKDIRECTORY/services/analytics.sh"

#########################################
# Import Veracode API Authentication
#########################################
source "$WORKDIRECTORY/services/api_authentication.sh"

#########################################
# Veracode Corporate Site
#########################################
source "$WORKDIRECTORY/services/corporate_site.sh"

#########################################
# Veracode Help Center
#########################################
source "$WORKDIRECTORY/services/help_center.sh"

#########################################
# Veracode Platform
#########################################
source "$WORKDIRECTORY/services/platform.sh"

#########################################
# Veracode Platform Authentication
#########################################
source "$WORKDIRECTORY/services/platform_authentication.sh"

#########################################
# MAIN FUNCTION
#########################################
function main()
{
    echo "####################"
    echo "#  Services Status #"
    echo "####################"
    echo "$(date)"
    echo " "
    echo "Veracode Analytics:"
    get_analytics_status
    echo " "
    echo "Veracode API Authentication:"
    get_api_authentication_status
    echo " "
    echo "Veracode Corporate Site:"
    get_corporate_site_status
    echo " "
    echo "Veracode Help Center:"
    get_help_center_status
    echo " "
    echo "Veracode Platform:"
    get_platform_status
    echo " "
    echo "Veracode Platform Authentication:"
    get_platform_authentication_status
    echo " "
    echo " "
    echo "*These statuses indicate the accessibility and speed of each service or website listed. They do not reflect scan speed."
    
}

main "$@"
exit;

#// curl the page and save content to tmp_file
#curl https://status.veracode.com > tmp_file_2
#https://mongocache.asm.ca.com/synth/current/113128/monitor/481388/?callback=parseJsonpResponse&fields=info;cur
#// Veracode Analytics
#//cat tmp_file | grep "id=\"cur_m_510757\"" | cut -d'>' -f4 | cut -d'<' -f1
#//cat tmp_file | grep "id=\"curr_status_desc_510757\""
#//cat tmp_file | grep "Service is operating normally"

#// Veracode API Authentication
#//cat tmp_file | grep "id=\"cur_m_481388\"" | cut -d'>' -f4 | cut -d'<' -f1
#//cat tmp_file | grep "id=\"curr_status_desc_481388\""
#//cat tmp_file | grep "Service is operating normally"


#Status normal = Service is operating normally