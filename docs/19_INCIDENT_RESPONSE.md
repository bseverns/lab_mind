# Incident Response

## When something breaks
Do the smallest honest thing first.

## First response
1. do not panic-change five things
2. photograph or copy the exact error
3. confirm power
4. confirm network
5. confirm NVMe mount
6. confirm Docker status
7. only then move to service logs

## Incident log
Use:
- `ops/jetson/templates/incident_report.md`

## Split the problem
Keep these separate:
- machine boot issue
- storage issue
- Docker issue
- service issue
- remote-access issue
- Digital Factory issue
- printer availability issue
- Cubiko issue
