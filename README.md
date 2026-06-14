# wildrig-miner

Dockerized [WildRig Multi](https://github.com/andru-kun/wildrig-multi) miner
for multi-algorithm GPU mining on NVIDIA tensor-core GPUs (10/20/30/40/50
series).

Image: [`swamp7/wildrig-miner`](https://hub.docker.com/r/swamp7/wildrig-miner)

## Tags

| Tag | wildrig-multi version | Notes |
|---|---|---|
| `swamp7/wildrig-miner:latest` | 0.48.3 | rolls forward with each release |
| `swamp7/wildrig-miner:0.48.3` | 0.48.3 | hotfix: RTX 2000 Pearl shares, GTX 16x0 attempt |
| `swamp7/wildrig-miner:0.48.0` | 0.48.0 | first build |

Pin to an exact version tag in production; the `:latest` tag follows the
newest release (currently 0.48.3).

## Usage

```bash
docker run --gpus all swamp7/wildrig-miner:0.48.3 \
    --algo <algorithm> \
    --url stratum+tcp://<pool>:<port> \
    --user <wallet>.<worker>
```

See the upstream release notes for the full algorithm list and per-coin
example commands at https://github.com/andru-kun/wildrig-multi/releases

<img width="1334" height="1853" alt="image" src="https://github.com/user-attachments/assets/4db67df5-1cfd-41d0-b582-0d6ad174e652" />

***
```bash
    -a pearlhash -o pool.pearlhash.xyz:9000 -u wallet.worker
```
***
