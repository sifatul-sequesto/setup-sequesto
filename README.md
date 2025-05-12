# Setup Sequesto

## Setting up the docker containers

You must run the docker-run\*.sh files in their numeric order.

1. Before running any of the file please update the `sequesto_data_dir` value for both `docker-run1.sh` and `docker-run2.sh` files. This value should be a valid path within your system. Why do you need this?--It's required for saving onlyoffice's data in your system from a place where you can quickly access them.

2. Start by running the first file with '1' in it's name.
   ```bash
   bash ./docker-run1.sh
   ```
3. This will setup the volumes for onlyoffice and start a new onlyoffice instance. Then it will start elasticserach and keep printing the internal logs in the terminal. Wait till you see something the following:
   ```
   ✅ Elasticsearch security features have been automatically configured!
   ✅ Authentication is enabled and cluster connections are encrypted.
   ```
4. Now copy the enrolment token and the elasticsearch password for future user.
5. On a new terminal run the next file:
   ```bash
   bash ./docker-run2.sh
   ```
6. This will spin up the kibana and start printing the logs. Wait till you get the url for kibana's dashboard with a one time code.
7. Use the code to open up kibana and use the enrolment token + elasticsearch password to login and finalize kibana setup.
8. Now run the next script to start the last remaining container.
   ```bash
   bash ./docker-run3.sh
   ```
9. After everything is done we need to update the configs of the onlyoffice container to make sure that its able to connect with our document-storage-service. Follow these steps to ensure that:
   1. Open your docker desktop and click on the `onlyoffice` container. Then choose the `Exec` tab from there. For linux users run `docker exec -it sequesto-onlyoffice bash`
   2. Open the target file with **nano** by running:
      ```bash
      nano /etc/onlyoffice/documentserver/local.json
      ```
   3. There you'll notice a field named **"CoAuthoring"**. We need to paste this following code within that field.
      ```json
      "request-filtering-agent": {
        "allowPrivateIPAddress": true,
        "allowMetaIPAddress": true
      },
      ```
   4. Now restart your **sequesto-onlyoffice** container to make the changes take affect.

With that you're done setting up the dockers for Sequesto.

## Fixes

### Kibana is not loading

If kibana starts to behave oddly and saying that kibana is not ready when opened 0.0.0.0:5601 on the browser then run the `docker./docker-fix-kibana.sh` script to fix the issue.

```bash
bash ./docker-fix-kibana.sh
```
