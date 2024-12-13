# LMOS demo

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
OPENAI_CLIENTNAME="azure"
OPENAI_MODELNAME="gpt-4o-mini"
OPENAI_URL="https://api.openai.com"
```

### Step 3: Install LMOS

Run the following commands to install LMOS onto Minikube:

```shell
./install.sh
```

### Step 3: Check the Setup

To verify the installation of LMOS, run:

```
kubectl get pods
```

Output:

```
NAME                                   READY   STATUS    RESTARTS   AGE
arc-view-runtime-web-db8d87c59-54k7b   2/2     Running   0          87s
lmos-operator-64bfb9b569-4l9qv         2/2     Running   0          2m22s
lmos-runtime-59ffdbdc6f-v5jtr          2/2     Running   0          2m21s
```

The status has to be `2/2 Running` for all three of them.

### Step 4: Access Kiali and Grafana

To visualize your setup, various ports have been forwarded for LMOS, Kiali, Prometheus and Grafana. You can access these tools at

- Kiali: http://localhost:20001
- Grafana: http://localhost:3000
- Prometheus: http://localhost:9090

The LMOS components can be accessed at:
- Arc View: http://localhost:8080 (Web)
- LMOS Runtime: http://localhost:8081 (API)

### Step 5: Install a demo

In the `demos` folder, you can find various demo setups.
To install a demo, run the corresponding `install.sh` script, e.g. for the `starter` demo:

```shell
./demos/starter/install.sh
```

## Using ArgoCD for deployment

You can add the `argocd-apps` folder as new ArgoCD application to your existing cluster ArgoCD managed cluster. You only need to adapt the secrets.yaml. 

## Code of Conduct

This project has adopted the [Contributor Covenant](https://www.contributor-covenant.org/) in version 2.1 as our code of conduct. Please see the details in our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). All contributors must abide by the code of conduct.

By participating in this project, you agree to abide by its [Code of Conduct](./CODE_OF_CONDUCT.md) at all times.

## Licensing
Copyright (c) 2024 Deutsche Telekom AG.

Sourcecode licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) (the "License"); you may not use this project except in compliance with the License.

This project follows the [REUSE standard for software licensing](https://reuse.software/).    
Each file contains copyright and license information, and license texts can be found in the [./LICENSES](./LICENSES) folder. For more information visit https://reuse.software/.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the LICENSE for the specific language governing permissions and limitations under the License.