FROM node:18-alpine

WORKDIR /app

COPY TODO/todo_backend/package*.json ./backend/
COPY TODO/todo_frontend/package*.json ./frontend/

RUN cd backend && npm install
RUN cd frontend && npm install

COPY . .

EXPOSE 5000

CMD ["node","TODO/todo_backend/server.js"]
