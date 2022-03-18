# Development environment - isolated Python environment, its own dependencies

### Create development environment

> python3 -m venv env

### Activate development environment

> source env/bin/activate

### Deactivate environment

> deactivate

# Repo for Python WebApp

Clone the application code

> git clone https://github.com/patrick-80074/python-webapp

Start gunicorn

> gunicorn --workers=2 --daemon --chdir python-webapp main:app

# NGINX Reverse Proxy
Need to configure NGINX as reverse proxy on Port 80 that forwards to 8000 / 8080

Create NGINX configuration
> sudo vi /etc/nginx/sites-available/webapp

server {
        listen 80;
        server_name vstudio.uk www.vstudio.uk;

        location / {
                proxy_pass http://127.0.0.1:8000;
        }
}

-- Commands to save and start NGINX settings:

> sudo ln -s /etc/nginx/sites-available/webapp /etc/nginx/sites-enabled
> sudo nginx -t
> sudo systemctl start nginx.service