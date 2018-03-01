# kotlin-rest
simple rest client/server made with kotlin

### prerequisites
 * java 8
 * gradle 3+
 
### build
```
gradle shadowJar
```

### run
```
java -jar build/libs/logger.jar
```

### URL
/hello

### Docker

```
docker build -t logger .
docker run -d -p7001:7001 logger
```
