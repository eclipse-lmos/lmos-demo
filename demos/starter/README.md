# Starter Demo

This demo shows how to install a simple demo setup with two agents and a channel.
The agents are a news agent and a weather agent. The channel is a web channel that uses both agents.

## Prerequisites

The initial setup of LMOS should be completed before installing the services for the starter demo.

## Installing the demo

Execute the following command to install the services for the starter demo:
```
./demos/starter/install.sh 
```

## Check the Setup

Two agents have been installed, you can list them with 

```
kubectl get agents
```

Output:

```
NAME                AGE
arc-news-agent      2m34s
arc-weather-agent   2m35s
```

One channel has been defined, using the capability of the weather-agent.

You can list available channels with the following command:

```
kubectl get channels
```

Output:

```
NAME               RESOLVE_STATUS
acme-web-stable    RESOLVED
```

The `RESOLVE_STATUS` of the channel has to be `RESOLVED`, which means the required capabilities have been resolved.
If the status is `UNRESOLVED`, you can check the reason with: 

```
kubectl get channel acme-web-stable -o yaml
```

You can list the resolved channelroutings with:

```
kubectl get channelroutings
```

And look at a specific channel routing with:

```
kubectl get channelrouting acme-web-stable -o yaml
```

### Example Usage

1. Use this URL http://localhost:8080/ to open arc-view web.
2. Type any query in the input box and press enter.
