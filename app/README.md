# Build
mvn clean package && docker build -t com.eldermoraes/app .

# RUN

docker rm -f app || true && docker run -d -p 8080:8080 -p 4848:4848 --name app com.eldermoraes/app 