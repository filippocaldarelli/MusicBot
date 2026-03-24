FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
ADD https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar /app/bot.jar
CMD ["java", "-jar", "bot.jar"]
