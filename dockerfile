# Stage 1: Build Python Application
FROM python:3.11 AS builder
WORKDIR /shopping-cart
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install flake8 pytest
COPY . .

# Stage 2: Create Production Image with Nginx
FROM nginx
COPY --from=builder /shopping-cart /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]