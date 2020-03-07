FROM    node:10-alpine as build
WORKDIR /usr/src/app
COPY    . .
RUN     npm install
RUN     npm run build


FROM    nginx 
EXPOSE  3000
COPY    ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY    --from=build /usr/src/app ./

CMD     [ "npm", "start" ]