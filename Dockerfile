#Stage 1

FROM maven:3.8.5-openjdk-17 as builder

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true

#stage 2
FROM openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar  /app/target/bankapp.jar

EXPOSE 8080

CMD [ "jave","-jar","/app/target/bankapp.jar" ]






