# Setup on linux cloud IDE's

# get the flutter binary
RUN git clone https://github.com/flutter/flutter.git

# set path
RUN export PATH="$PATH:`pwd`/flutter/bin"

# restart shell
RUN source ~/.bashrc

# run flutter docter
RUN flutter doctor