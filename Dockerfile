# Step 1: Build the site
FROM klakegg/hugo:ext-alpine AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# Step 2: Serve with nginx
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
