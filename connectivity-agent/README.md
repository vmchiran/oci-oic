# Oracle Integration (OIC) - Connectivity Agent as a Linux Service
The following guide was tested on a Compute VM running in Oracle Cloud Infrastructure (OCI) with CentOS 7.

## Paths used in this guide
* AGENT_HOME: `/home/opc/oic-agent`

## Pre-requisites
* Agent installed and configured under AGENT_HOME, including the oic_USER and oic_PASSWORD.

  Installation instructions can be found in the official documentation: https://docs.oracle.com/en/cloud/paas/integration-cloud/integrations-user/agent-download-and-installation.html#GUID-932D53E0-69F1-42E2-8F9C-B2CB3B69A5B4

## Setting up the Linux Service
1. If using different AGENT_HOME, modify oic-agent.sh and oic-agent.service accordingly.
1. Copy oic-agent.sh under AGENT_HOME and set execute permission.

    `cp oic-agent.sh /home/opc/oic-agent`

    `chmod 740 /home/opc/oic-agent/oic-agent.sh`
1. Copy oic-agent.service under `/etc/systemd/system`

    `sudo cp oic-agent.service /etc/systemd/system/`
1. Enable the agent to start automatically at boot

    `sudo systemctl enable oic-agent.service`

## Controlling the Agent
1. Using oic-agent.sh

    `./oic-agent.sh start`

    `./oic-agent.sh stop`

    `./oic-agent.sh status`

    To view the command output, under AGENT_HOME check the init.log: `tail -f /home/opc/oic-agent/init.log`
1. Using systemctl commands

    `sudo systemctl start oic-agent`

__NB. Give 30s-1min between start/stop commands, to allow state synchronization between the agent and the OIC instance.__
