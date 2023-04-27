# Pulling Ubuntu image
FROM ubuntu:20.04

# Updating packages and installing cron
RUN apt-get update && apt-get install cron -y 

# Copying script file into the container
COPY date-script.sh .

# Giving executable permission to the script file
RUN chmod +x date-script.sh

# Adding crontab to the appropriate location
RUN echo "*/1 * * * * root cp -R /data1 /data/\n*/1 * * * * root cp -R /data2 /data" > /etc/cron.d/my-cron-file

# Giving permission to crontab file
RUN chmod 0644 /etc/cron.d/my-cron-file

# Running crontab
RUN crontab /etc/cron.d/my-cron-file

# Creating entry point for cron 
CMD ["cron", "-f"]