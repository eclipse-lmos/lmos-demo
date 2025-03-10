[![Apache 2.0 License](https://img.shields.io/badge/license-Apache%202.0-green.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
[![REUSE Compliance Check](https://github.com/eclipse-lmos/lmos-demo/actions/workflows/reuse.yaml/badge.svg)](https://github.com/eclipse-lmos/lmos-demo/actions/workflows/reuse.yaml)

# LMOS Demo

A LMOS demo using GitHub Codespaces / Development Containers.

## Prerequisites

Before you begin, ensure the following tools are installed and running on your local machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Using the Development Container

### Step 1: Open the Repository in a Dev Container

1. Clone the repository:
    ```shell
    git clone https://github.com/eclipse-lmos/lmos-demo.git
    cd lmos-demo

2. Open the repository in Visual Studio Code:

3. Open the Command Palette (F1 or Ctrl+Shift+P) and select `Remote-Containers: Reopen in Container`. This will build and open the repository in a Docker-based development container, in which Minikube is already installed and started.

### Step 2: Set OpenAI Connection Details

Once inside the development container, set up the necessary environment variables for OpenAI API access in the `.env` file.
This OpenAPI access is used by the `lmos-runtime` and the agents.

```
OPENAI_APIKEY="<your-openai-api-key>"
OPENAI_CLIENTNAME="openai"
OPENAI_MODELNAME="gpt-4o-mini"
OPENAI_URL="https://api.openai.com"
OPENAI_PROVIDER="openai"
```

### Step 3: Install LMOS

Run the following commands to install LMOS onto Minikube:

```shell
./install.sh
```

### Step 4: Check the Setup

To verify the installation of LMOS, run:

```
kubectl get pods
```

Output:

```
NAME                                   READY   STATUS    RESTARTS   AGE
arc-view-web-db8d87c59-54k7b           2/2     Running   0          87s
lmos-operator-64bfb9b569-4l9qv         2/2     Running   0          2m22s
lmos-runtime-59ffdbdc6f-v5jtr          2/2     Running   0          2m21s
```

The status has to be `2/2 Running` for all three of them.

### Step 5: Install a demo

In the `demos` folder, you can find various demo setups.
To install a demo, run the corresponding `install.sh` script, e.g. for the `starter` demo:

```shell
./demos/starter/install.sh
```

### Step 6: Access the demo

To access the demo, ports to the installed services and agents have been forwarded from the Minikube cluster and 
should be accessible from your browser. A dashboard provides a simple entry point to the different services and can be 
accessed as follows:

* LMOS Demo dashboard: http://localhost:8082

On the dashboard, you find links to the Arc View (a graphical user interface to interact with the 
installed agents), as well as links to some tools (Prometheus and Grafana for monitoring, Kiali for inspecting the  
Istio service mesh). In case you are interested in the GraphQL API of the installed agents, the dashboard also provides
links to interfaces for interacting with these APIs.

## Using ArgoCD for deployment

You can add the `argocd-apps` folder as new ArgoCD application to your existing cluster ArgoCD managed cluster. You only need to adapt the secrets.yaml. 

## Code of Conduct

This project has adopted the [Contributor Covenant](https://www.contributor-covenant.org/) in version 2.1 as our code of conduct. Please see the details in our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). All contributors must abide by the code of conduct.

By participating in this project, you agree to abide by its [Code of Conduct](./CODE_OF_CONDUCT.md) at all times.

## Licensing
Copyright (c) 2025 Deutsche Telekom AG and others.

Sourcecode licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) (the "License"); you may not use this project except in compliance with the License.

This project follows the [REUSE standard for software licensing](https://reuse.software/).    
Each file contains copyright and license information, and license texts can be found in the [./LICENSES](./LICENSES) folder. For more information visit https://reuse.software/.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the LICENSE for the specific language governing permissions and limitations under the License.