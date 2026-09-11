# wildrig-miner

Dockerized [WildRig Multi](https://github.com/andru-kun/wildrig-multi) miner
for multi-algorithm GPU mining on NVIDIA tensor-core GPUs (10/20/30/40/50
series).

Image: [`swamp7/wildrig-miner`](https://hub.docker.com/r/swamp7/wildrig-miner)

## Tags

| Tag | wildrig-multi version | Notes |
|---|---|---|
| `swamp7/wildrig-miner:latest` | 0.51.2 | rolls forward with each release |
| `swamp7/wildrig-miner:0.51.2` | 0.51.2 | stability fixes; slightly better efficiency on RTX 5000; V100 pearlhash bump; AMD pearlhash fixed + bumps for AMD 6000/7000/9000 |
| `swamp7/wildrig-miner:0.51.2` | 0.51.1 | pearlhash +5% on H20/H100/H200/H800; minor CMP 70HX/90HX bump |
| `swamp7/wildrig-miner:0.51.0` | 0.51.0 | pearlhash bumps for RTX 2000/3000/4000 + CMP 40HX/50HX; small RTX 5000 + H100 bump |
| `swamp7/wildrig-miner:0.50.9.1` | 0.50.9.1 | hotfix — fixes H20/H100/H200/H800 broken in 0.50.9; small pearlhash bump on same |
| `swamp7/wildrig-miner:0.50.9` | 0.50.9 | pearlhash +50% on B200 (~1.4 PH/s @ 990W); NEW B300 support (~790 TH/s @ 1000W). ⚠️ H100/H200 broken — use 0.50.9.1+ |
| `swamp7/wildrig-miner:0.50.8` | 0.50.8 | pearlhash +10% on RTX 2000 + CMP40HX/50HX; small bump RTX 4000; fixed extra memory alloc on non-Blackwell |
| `swamp7/wildrig-miner:0.50.7` | 0.50.7 | RTX 5000 pearlhash kernels rewritten (prior via `--pearlhash-kernel 2`); new kernels want OC re-tune |
| `swamp7/wildrig-miner:0.50.6` | 0.50.6 | **NVIDIA B200** pearlhash support (910 TH/s @ 990W); re-upload fixes disabled non-pearlhash algos |
| `swamp7/wildrig-miner:0.50.5` | 0.50.5 | Hopper (H20/H100/H200/H800) pearlhash — big jump over 0.50.4 |
| `swamp7/wildrig-miner:0.50.4` | 0.50.4 | pearlhash +130% on V100, +10% on A100/CMP190HX, +8% on RTX 2000; initial Hopper support (unoptimized) |
| `swamp7/wildrig-miner:0.50.3` | 0.50.3 | AMD pearlhash fix; GTX 1660 pearlhash fix; +20% unlocked CMP90HX; new `--gpu-delay-oc` flag |
| `swamp7/wildrig-miner:0.50.2` | 0.50.2 | pearlhash bumps for RTX 2000/3000/4000/5000; AMD pearlhash fixed |
| `swamp7/wildrig-miner:0.50.1` | 0.50.1 | Pearl hardfork support for **pearlhash.xyz** pool; RTX 3000/4000 pearlhash kernels retuned for efficiency (over max hashrate) |
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
newest release (currently 0.51.2).

## Usage

```bash
docker run --gpus all swamp7/wildrig-miner:0.51.2 \
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
