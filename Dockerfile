# FROM node
# WORKDIR /app
# COPY package*.json /app/
# RUN npm install
# COPY . /app
# RUN npm run build

# FROM nginx
# COPY --from=0 /app/dist /usr/share/nginx/html
# COPY --from=0 /app /usr/share/nginx/html
# COPY --from=0 /app/nginx.conf /etc/nginx/conf.d/default.conf

# 暂时不管以下nginx.conf中nginx的配置，有点错误。。导致docker运行后会自动停止

# FROM nginx

# COPY dist/ /usr/share/nginx/html/
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# FROM node:14
# COPY ./ /app
# WORKDIR /app
# RUN npm install && npm run build

# FROM nginx

# # 据说--from=0是上面构建出来的内容
# COPY --from=0 /app/dist /usr/share/nginx/html
# # COPY ./dist /usr/share/nginx/html

# EXPOSE 80

FROM node:14
COPY ./ /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf