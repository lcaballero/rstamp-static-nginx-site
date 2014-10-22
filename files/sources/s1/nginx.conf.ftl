
worker_processes 1;
error_log <%= app_dir %>/nginx.error.logs;


events {
worker_connections 2048;
}


http {
  server {
    set $app_root <%= app_dir %>;
    listen <%= port %> default_server;

    location / {
      root $app_root/app/html;
    }
    location /images/ {
      root $app_root/app/images;
    }
  }
}