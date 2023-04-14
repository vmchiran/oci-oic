# Oracle Integration (OIC) - Connectivity Agent as a Linux Service
The following guide explains how to set up the OIC connectivity agent as a linux service and control the agent using a bash script to run start / stop commands.

The setup was tested on a Compute VM with Oracle Linux 8, running in Oracle Cloud Infrastructure (OCI).

## Paths used in this guide
* AGENT_HOME: `/home/opc/oic-agent`

## Pre-requisites
* Agent installed and configured under AGENT_HOME.

* Installation instructions can be found in the official documentation:
    * OIC Generation 2: https://docs.oracle.com/en/cloud/paas/integration-cloud/integrations-user/downloading-and-running-premises-agent-installer.html#GUID-3F36A9CE-BE4E-4A74-AE7E-C6005CC97A12
    * OIC3: https://docs.oracle.com/en/cloud/paas/application-integration/integrations-user/downloading-and-running-premises-agent-installer.html#GUID-3F36A9CE-BE4E-4A74-AE7E-C6005CC97A12

## Setting up the Linux Service
1. If you prefer to use a different AGENT_HOME, modify oic-agent.sh and oic-agent.service accordingly.
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
