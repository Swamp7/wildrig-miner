# wildrig-miner

Dockerized [WildRig Multi](https://github.com/andru-kun/wildrig-multi) miner
for multi-algorithm GPU mining on NVIDIA tensor-core GPUs (10/20/30/40/50
series).

Image: [`swamp7/wildrig-miner`](https://hub.docker.com/r/swamp7/wildrig-miner)

## Tags

| Tag | wildrig-multi version | Notes |
|---|---|---|
| `swamp7/wildrig-miner:latest` | 0.48.0 | rolls forward with each release |
| `swamp7/wildrig-miner:0.48.0` | 0.48.0 | upstream release |

Pin to an exact version tag in production; the `:latest` tag follows the
newest release (currently 0.48.0).

## Usage

```bash
docker run --gpus all swamp7/wildrig-miner:0.48.0 \
    --algo <algorithm> \
    --url stratum+tcp://<pool>:<port> \
    --user <wallet>.<worker>
```

See the upstream release notes for the full algorithm list and per-coin
example commands at https://github.com/andru-kun/wildrig-multi/releases
