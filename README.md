# awslabs
Repo for Python WebApp

Clone the application code

> git clone https://github.com/patrick-80074/python-webapp

Start gunicorn

> gunicorn --workers=2 --daemon --chdir python-webapp main:app

Need to configure NGINX as reverse proxy on Port 80 

-- Create NGINX configuration
> sudo nano /etc/nginx/sites-available/webapp

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