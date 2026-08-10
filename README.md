# wildrig-miner

Dockerized [WildRig Multi](https://github.com/andru-kun/wildrig-multi) miner
for multi-algorithm GPU mining on NVIDIA tensor-core GPUs (10/20/30/40/50
series).

Image: [`swamp7/wildrig-miner`](https://hub.docker.com/r/swamp7/wildrig-miner)

## Tags

| Tag | wildrig-multi version | Notes |
|---|---|---|
| `swamp7/wildrig-miner:latest` | 0.50.0 | rolls forward with each release |
| `swamp7/wildrig-miner:0.50.0` | 0.50.0 | pearlhash improvements for RTX 3000/4000/5000 |
| `swamp7/wildrig-miner:0.49.9` | 0.49.9 | pearlhash power-efficiency bump on RTX 3000/4000/5000; older NVIDIA driver support restored; AMD pearlhash fixed (hashrate drop expected) |
| `swamp7/wildrig-miner:0.49.8` | 0.49.8 | **MANDATORY for Pearl rank-128 softfork at block 96,251.** Remove any `--pearlhash-kernel` flag after fork block or shares reject; ~5% hashrate drop expected |
| `swamp7/wildrig-miner:0.49.6` | 0.49.6 | pearlhash bump for RTX 3000/4000 + A100 + CMP170HX (unlocked) |
| `swamp7/wildrig-miner:0.49.5` | 0.49.5 | AMD 9000 pearlhash +10%; fixes non-pearlhash algos broken since 0.48.4 |
| `swamp7/wildrig-miner:0.49.4` | 0.49.4 | pearlhash perf bump for RTX 3000/4000/5000 (default kernel now 2; old via `--pearlhash-kernel 1`); CMP 170HX sm80 kernel default |
| `swamp7/wildrig-miner:0.49.3` | 0.49.3 | pearlhash RAM fix, RTX 4000 qhash fix, AMD 6000 pearlhash fix, restores AMD support for non-pearlhash algos |
| `swamp7/wildrig-miner:0.48.9` | 0.48.9 | RTX 3000 pearlhash bump; reverts 4060Ti/4070Ti pearlhash kernel to default (use `--pearlhash-kernel 2` for the prior one) |
| `swamp7/wildrig-miner:0.48.7` | 0.48.7 | RTX 2000 pearlhash +10%, fixes "unsupported architecture" regression from 0.48.6 |
| `swamp7/wildrig-miner:0.48.3` | 0.48.3 | hotfix: RTX 2000 Pearl shares, GTX 16x0 attempt |
| `swamp7/wildrig-miner:0.48.0` | 0.48.0 | first build |

Pin to an exact version tag in production; the `:latest` tag follows the
newest release (currently 0.50.0).

## Usage

```bash
docker run --gpus all swamp7/wildrig-miner:0.50.0 \
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
