# Load balancer

Bash automation for the load-balancing project on Ubuntu 16.04.

## Scripts

- **`0-custom_http_response_header`** — Run on **web-01** and **web-02**. Installs Nginx, serves the Holberton School index page on port 80, and adds **`X-Served-By`** with this machine’s **`hostname`** so you can see which backend answered (e.g. `6829-web-01`). Use `curl -sI YOUR_WEB_IP | grep X-Served-By` to verify. Hostnames should follow your cohort pattern (e.g. `[ID]-web-01`).

- **`1-install_load_balancer`** — Run on **lb-01**. Installs HAProxy, enables it via `/etc/default/haproxy`, and balances HTTP with **`balance roundrobin`** to the two backends. **Edit `web_01_ip` and `web_02_ip`** at the top of the script to match the public IPs from your dashboard. Manage with the init script: `sudo service haproxy restart` (do not rely on `systemctl` in this project).

## Optional helpers

- **`web-01`** / **`web-02`** — Local SSH convenience scripts; replace IPs and key paths for your environment.

## Flow

1. Run `0-custom_http_response_header` on both app servers.
2. Update backend IPs in `1-install_load_balancer`, run it on the load balancer.
3. Point your domain **A record** at **lb-01**’s public IP (if the project requires it).
