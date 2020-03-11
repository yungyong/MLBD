FROM cloudera/quickstart:latest

RUN yum install -y https://repo.ius.io/ius-release-el6.rpm

RUN yum install -y python35u python35u-pip python35u-devel
RUN yum -y install gcc-c++ freetype-devel libpng-devel atlas-devel blas-devel pandoc ; yum clean all

RUN pip3.5 install -U pip
RUN pip3.5 install -U jupyter nano
RUN pip3.5 install -U py4j

COPY requirements.txt ./
RUN pip3.5 install -r requirements.txt 

RUN  ln -s /etc/hive/conf/hive-site.xml /etc/spark/conf

RUN yum -y remove java && yum install -y java-1.8.0-openjdk
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk.x86_64

WORKDIR /tmp
COPY spark-2.4.4-bin-hadoop2.6.tgz .
RUN tar -xvf spark-2.4.4-bin-hadoop2.6.tgz && mv spark-2.4.4-bin-hadoop2.6 /usr/local/spark

RUN sed 's/\/usr\/lib\/spark/\/usr\/local\/spark/g' /usr/bin/pyspark
RUN sed 's/\/usr\/lib\/spark/\/usr\/local\/spark/g' /usr/bin/spark-shell
RUN sed 's/\/usr\/lib\/spark/\/usr\/local\/spark/g' /usr/bin/spark-submit

ENV SPARK_HOME /usr/local/spark
ENV PATH $SPARK_HOME/bin:$PATH
ENV PYSPARK_PYTHON python3.5
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip

WORKDIR /workspace
