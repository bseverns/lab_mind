# Ben Fast Path

## First useful shell pass

```bash
hostname
lsblk
df -h
docker ps
curl -fsS http://127.0.0.1:11434/api/tags || true
```

## Rebuild order

1. Jetson-A boot + NVMe + Docker
2. assistant UI + model
3. cockpit page
4. Jetson-C docs fallback
5. Jetson-B sentinel
6. Headscale remote access
7. Digital Factory status bridge
8. CNCjs only if physical placement makes sense

## Do not spend time on

- distributed inference across old Nanos
- making all nodes symmetrical
- public dashboards
- perfect automation before the first working cockpit
