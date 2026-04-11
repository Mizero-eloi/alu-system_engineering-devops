# Web server

Scripts and files for the Web Infrastructure project: deploy Nginx on Ubuntu 16.04, optional domain setup, HTTP redirect, and custom 404 handling.

## Contents

- `0-transfer_file` — copy a file to the server home directory with `scp`
- `1-install_nginx_web_server` — install Nginx and serve the required index page on port 80
- `2-setup_a_domain_name` — answer file: root domain only (A record → `web-01` IP)
- `3-redirection` — permanent redirect for `/redirect_me`
- `4-not_found_page_404` — custom 404 body containing `Ceci n'est pas une page`
- `5-design_a_beautiful_404_page.html` — creative 404 (must still include the required string if used as default)

## Notes

- Do not use `systemctl`; use `service nginx restart` (or equivalent) on Ubuntu 16.04.
- Bash scripts use `#!/usr/bin/env bash` and should pass Shellcheck.
