FROM nikolaik/python-nodejs:python3.12-nodejs22

# 安装 docker CLI（一定要在前面执行）
USER root
RUN apt-get update && apt-get install -y docker.io

# 设置工作目录
WORKDIR /app
COPY . /app

# 启用 pnpm（更稳妥方式）
RUN corepack enable && corepack prepare pnpm@latest --activate
# 安装依赖
RUN pnpm install