#!/usr/bin/with-contenv bashio

for runner in $(bashio::config 'runners|keys'); do

    runner_url=$(bashio::config "runners[${runner}].url")
    runner_name=$(bashio::config "runners[${runner}].name")
    runner_token=$(bashio::config "runners[${runner}].token")
    runner_labels=$(bashio::config "runners[${runner}].labels")

    bashio::log.info "Install runner ${runner_name}"
    bashio::log.info "Create space for runner ${runner_name}"

    rm -rf /actions-runner/${runner_name}
    mkdir -p /actions-runner/${runner_name}
    cp -r /actions-runner-tmp/. /actions-runner/${runner_name}

    bashio::log.info "Install dependencies for runner ${runner_name}"
    /actions-runner/${runner_name}/bin/installdependencies.sh > /dev/null 2>&1

    bashio::log.info "Start runner ${runner_name}"
    bashio::log.info "/config.sh --runasservice --unattended --replace --url ${runner_url} --token XXXXXXXXXXXX --name ${runner_name} --labels ${runner_labels}"

    /actions-runner/${runner_name}/config.sh --runasservice --unattended --replace --url ${runner_url} --token ${runner_token} --name ${runner_name} --labels ${runner_labels}
    /actions-runner/${runner_name}/run.sh &
done

bashio::log.info "All runners started"

while :; do sleep 1; done

