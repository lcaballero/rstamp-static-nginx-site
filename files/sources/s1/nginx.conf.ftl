
worker_processes 1;
error_log <%= app_dir %>/logs/nginx.error.logs;


events {
worker_connections 2048;
}


http {
  include mime.types;

  server {
    set $app_root <%= app_dir %>/app;
    listen <%= port %> default_server;

    location / {
      root $app_root/;
    }
    location /images/ {
      root $app_root/images;
    }
  }
}