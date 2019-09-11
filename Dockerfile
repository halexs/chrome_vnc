FROM ubuntu:trusty
RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install x11vnc.
RUN apt-get install -y x11vnc
# Install xvfb.
RUN apt-get install -y xvfb
# Install fluxbox.
RUN apt-get install -y fluxbox
# Install wget.
RUN apt-get install -y wget
# Install wmctrl.
RUN apt-get install -y wmctrl
# Set the Chrome repo.
RUN wget --no-check-certificate -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable

COPY x_script.sh /x_script.sh
CMD '/x_script.sh'