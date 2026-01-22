# 使用Nginx提供静态文件
FROM nginx:alpine

# 设置时区（UTC+8）
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

# 复制本地构建的应用到Nginx目录
COPY ./build /usr/share/nginx/html

# 添加自定义Nginx配置
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]
