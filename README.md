# dimo

Gitea Actions Runner running-on PaaS suppeorted `--privileged`

> USE docker:dind  
> USE komari-agent

### Running on **Local**

```bash
docker run -d \
  --privileged \
  -p 8080:8080 \
  -e GITEA_URL="https://gitea.your-domain.com" \
  -e RUNNER_TOKEN="gitea-actions-runner-token" \
  -e RUNNER_NAME="dimo" \
  -e KOMARI_SERVER="https://komari-moniter.your-domain.com" \
  -e KOMARI_SECRET="komora-auto-dicover-secret" \
  --name dimo \
  znxr/dimo:latest
```
