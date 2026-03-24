FROM openjdk:11-jre-slim
WORKDIR /app

# Scarica l'ultima versione stabile del JAR (0.4.5)
ADD https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar /app/bot.jar

# Imposta il comando di avvio
CMD ["java", "-jar", "bot.jar"]
