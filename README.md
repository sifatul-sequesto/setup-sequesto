# Setup Sequesto

## Setting up the docker containers

You must run the docker-run*.sh files in their numeric order.
1. Start by running the first file with '1' in it's name.
  ```bash
  bash ./docker-run1.sh
  ```
2. This will setup the volumes for onlyoffice and start a new onlyoffice instance. Then it will start elasticserach and keep printing the internal logs in the terminal. Wait till you see something the following:
  ```
  ✅ Elasticsearch security features have been automatically configured!
  ✅ Authentication is enabled and cluster connections are encrypted.
  ```
3. Now copy the enrolment token and the elasticsearch password for future user.
4. On a new terminal run the next file:
  ```bash
  bash ./docker-run2.sh
  ```
5. This will spin up the kibana and start printing the logs. Wait till you get the url for kibana's dashboard with a one time code.
6. Use the code to open up kibana and use the enrolment token + elasticsearch password to login and finalize kibana setup.
7. Now run the next script to start the last remaining container.
  ```bash
  bash ./docker-run3.sh
  ```
8. And done, all set!

## Fixes

### Kibana is not loading

If kibana starts to behave oddly and saying that kibana is not ready when opened 0.0.0.0:5601 on the browser then run the `docker./docker-fix-kibana.sh` script to fix the issue.
```bash
bash ./docker-fix-kibana.sh
```
