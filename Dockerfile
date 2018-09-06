# 指定基础镜像
FROM webdevops/php-nginx:alpine

# 指定制作镜像的联系人（镜像创建者）
MAINTAINER XQ <5273508@qq.com>

RUN rm -rf /etc/nginx/conf.d

COPY phpweb.conf /etc/nginx/conf.d/phpweb.conf

COPY www /app

#COPY php-fpm.sh /opt/docker/bin/php-fpm.sh

#RUN mkdir /app/Uploads
#RUN chmod -R 777 /app/Uploads


RUN mkdir /app/App/Runtime
RUN chmod -R 777 /app/App/Runtime

WORKDIR /app

VOLUME /app/Uploads

# php-fpm使用以下配置
##EXPOSE 9000
#RUN bash /opt/docker/bin/php-fpm.sh

# swoole 使用以下配置
#EXPOSE 8000

#CMD ["nginx","-g","daemon off;"]

CMD ["supervisord"]