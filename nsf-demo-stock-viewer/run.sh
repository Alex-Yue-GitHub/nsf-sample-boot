#!/usr/bin/env bash
#java -javaagent:/opt/nsf/nsf-agent-fat.jar=nsf -javaagent:/opt/apm/skywalking-napm-bin-8.10.0-latest/agent/skywalking-agent.jar -Dskywalking_config=/opt/apm/skywalking-napm-bin-8.10.0-latest/agent/config/agent.config -jar /opt/nsf/nsf-demo-stock-viewer-1.0-SNAPSHOT.jar
java -jar /opt/nsf/nsf-demo-stock-viewer-1.0-SNAPSHOT.jar
