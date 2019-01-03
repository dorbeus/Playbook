FROM stakater/pipeline-tools:1.15.0

LABEL name="Stakater Playbook" \
      maintainer="Stakater <stakater@aurorasolutions.io>" \
      vendor="Stakater" \
      release="1" \
      summary="Stakater Playbook"

WORKDIR $HOME/application

# copy the entire application
COPY . .

# install yarn globaly
RUN npm install -g yarn

# download the application dependencies
RUN yarn install

# build the application
RUN yarn run build

ENTRYPOINT ["yarn", "run", "serve"]
