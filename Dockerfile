FROM eclipse-temurin:17-jdk-jammy AS runtime-java

WORKDIR /app

COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]


FROM nginx:stable-alpine AS runtime-node
COPY build/ /usr/share/nginx/html

# Remove default nginx welcome page if you prefer (optional)
RUN rm -f /usr/share/nginx/html/index.html.default || true

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
