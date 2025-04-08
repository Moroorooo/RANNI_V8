# Sử dụng image OpenJDK 11 làm base
FROM openjdk:11-jdk-slim

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy toàn bộ code vào container
COPY . /app

# Cài đặt Maven và build dự án
RUN apt-get update && apt-get install -y maven
RUN mvn clean package

# Copy file JAR đã build vào thư mục chạy
RUN cp target/JMusicBot-Snapshot-All.jar JMusicBot.jar

# Thiết lập lệnh chạy bot với biến môi trường
CMD ["java", "-jar", "JMusicBot.jar"]