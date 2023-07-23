# Backend

## Service Server

### PORT
    9100 : Node-Exporter
    6379 : Redis
    5000 : Django_Project
    80   : Nginx
### Initialize
`bash backend/server_init.sh`
### Refreshing
`bash backend/server_refresh.sh`



## Monitoring Server
### PORT
    3000 : Grafana
    9090 : Prometheus

### Initialize
`bash backend/monitoring_init.sh`
### Refreshing

`bash backend/monitoring_refresh.sh`