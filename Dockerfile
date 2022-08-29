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

FROM nginx

COPY ./dist /usr/share/nginx/html

EXPOSE 80

# 暂时不管以下nginx.conf中nginx的配置，有点错误。。导致docker运行后会自动停止

# FROM nginx

# COPY dist/ /usr/share/nginx/html/
# COPY nginx.conf /etc/nginx/conf.d/default.conf