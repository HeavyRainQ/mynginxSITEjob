server {
    listen 80;

    server_name mytasksite3.ru;

    location / {
        proxy_pass http://192.168.0.110:82/;
    }
}
