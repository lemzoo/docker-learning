FROM centos

# RUN yum update -y
# RUN yum upgrade -y
RUN yum install -y python3
RUN yum install -y python3-pip

RUN pip install flask

COPY . /opt/web-app

EXPOSE 5000
ENTRYPOINT ["FLASK_APP=/opt/web-app/app.py", "flask run"]
