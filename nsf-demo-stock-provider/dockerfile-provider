FROM openjdk:8

ENV TZ=Asia/Shanghai LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN mkdir -p /opt/nsf && mkdir -p /opt/apm

RUN cd /opt/apm && wget "http://console.service.163.org/download/napm/skywalking-napm-bin-8.5.0-latest.tar.gz" -O skywalking-napm-bin-8.5.0-latest.tar.gz && \
tar zxvf skywalking-napm-bin-8.5.0-latest.tar.gz


RUN mkdir -p /opt/nsf && cd /opt/nsf && \
    wget "https://hedutest.nos-eastchina1.126.net/nsf-agent-v2.6.8-c2a5e1f9-20201203-141827.jar" -O nsf-agent.jar
    
ADD ./*/target/nsf*.jar /app.jar

ADD ./*/target/classes/nsf.yml /opt/nsf/


ENTRYPOINT ["java","-Dserver.port=8080","-Dstock_viewer_url=http://stock-viewer-wanchu", "-Dstock_provider_url=http://stock-provider-wanchu", "-Dstock_advisor_url=http://stock-advisor-wanchu", "-Dnsf.prometheus.enable=true","-javaagent:/opt/nsf/nsf-agent.jar=nsf","-javaagent:/opt/apm/skywalking-napm-bin-8.5.0-latest/agent/skywalking-agent.jar","-Dskywalking_config=opt/apm/skywalking-napm-bin-8.5.0-latest/agent/config/agent.config","-jar","/app.jar"]
