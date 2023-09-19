
FROM python:3.8-slimuster-b

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

# Change: Removed the unnecessary "cd /" command

RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /LUCIFER
WORKDIR /LUCIFER
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]

# Add: Expose TCP port 80
EXPOSE 80
