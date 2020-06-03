# Oracle Integration (OIC) - Connectivity Agent as a Linux Service
The following guide was tested on a Compute VM running in Oracle Cloud Infrastructure (OCI) with CentOS 7.

## Paths used in this guide
* AGENT_HOME: `/home/opc/oic-agent`

## Pre-requisites
* Agent installed and configured under AGENT_HOME.

  Installation instructions can be found in the official documentation: https://docs.oracle.com/en/cloud/paas/integration-cloud/integrations-user/downloading-and-running-premises-agent-installer.html#GUID-3F36A9CE-BE4E-4A74-AE7E-C6005CC97A12

## Setting up the Linux Service
1. If using different AGENT_HOME, modify oic-agent.sh and oic-agent.service accordingly.
1. Copy oic-agent.sh under AGENT_HOME.
1. Set execute permission on `oic-agent.sh`

    `chmod 740 oic-agent.sh`
1. Copy oic-agent.service under `/etc/systemd/system`

    `sudo cp oic-agent.service /etc/systemd/system/`
1. Enable the agent to start automatically at boot

    `sudo systemctl enable oic-agent.service`

## Controlling the Agent
1. Using oic-agent.sh

    `./oic-agent.sh start`

    `./oic-agent.sh stop`

    `./oic-agent.sh status`
1. Using systemctl commands

    `sudo systemctl start oic-agent`