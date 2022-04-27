# 基础镜像使用java
FROM openjdk:11-jre
# 作者
MAINTAINER zhuhodor <zhd30@outlook.com>
# 环境变量
ENV ROOTPATH /usr/local
# 工作目录，容器交互终端默认落脚点
WORKDIR $ROOTPATH
# VOLUME 指定了数据卷，宿主机目录在 /var/lib/docker下
VOLUME /tmp
# 将jar包添加到容器中并更名为pets.jar，注意宿主机的相对路径
ADD ./pets-server-0.0.1-SNAPSHOT.jar pets.jar
# docker build时执行，运行jar包
RUN bash -c 'touch /pets.jar'
#容器start时执行的命令，加入JVM参数
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","--add-opens","java.base/java.lang=ALL-UNNAMED",\
"--add-opens","java.base/java.util=ALL-UNNAMED","--add-opens","java.desktop/java.awt.font=ALL-UNNAMED",\
 "-jar","/pets.jar"]
 #作为参数加到ENTRYPOINT后面
CMD ["--spring.profiles.active=docker"]
#暴露端口，docker run 时还是需要-p的，这里的EXPOSE只是为了-P有效，比较鸡肋
EXPOSE 80 8888 5672 6379 3306
