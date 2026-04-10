# Backup and Restore

## What to preserve
Back up:
- env files
- Docker Compose files
- Headscale value sheet
- service data on NVMe where appropriate
- bookmarks export
- printer fleet inventory notes
- rebuild log

## Backup classes
### Tiny text backups
- `.env`
- markdown docs
- inventory CSVs
- rebuild logs

### Service-state backups
- Portainer data
- Open WebUI data
- Node-RED data
- Syncthing config
- CNCjs data if present

## Restore order
1. boot from known-good microSD
2. mount NVMe
3. reinstall Docker if needed
4. restore Compose/env files
5. start containers
6. restore private access
7. verify browser cockpit
8. verify Digital Factory separately

## Rule
A restore is only real when it has been rehearsed.
