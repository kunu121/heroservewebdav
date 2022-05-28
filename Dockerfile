FROM developeranaz/rc-index:latest
RUN curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip' && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 777 /usr/bin/rclone
RUN rclone version
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
CMD /entrypoint.sh