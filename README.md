# Setup Sequesto

## Setting up the Docker containers

You must run the docker-run\*.sh files in numerical order.

1. Before running any of the files, please update the `sequesto_data_dir` value for both `docker-run1.sh` and `docker-run2.sh` files. This value should be a valid path within your system. Why do you need this? — It's required for saving OnlyOffice's data on your system in a known location, so you can quickly access it to add or remove custom fonts, etc.

2. Start by running the first file with '1' in its name.
   ```bash
   bash ./docker-run1.sh
   ```
3. This will set up the volumes for OnlyOffice and start a new OnlyOffice instance. Then it will start Elasticsearch and keep printing the internal logs in the terminal. Wait until you see something like the following:

   ```
   ✅ Elasticsearch security features have been automatically configured!
   ✅ Authentication is enabled and cluster connections are encrypted.

   ℹ️  Password for the elastic user (reset with `bin/elasticsearch-reset-password -u elastic`):
     7W4REicyhVlmxdB0X-Oy

   ℹ️  HTTP CA certificate SHA-256 fingerprint:
     ad1fdcd9a9b4e55cfb1cd66f5b952301c33c9a65f7e6daa36f618c189c9e3dd0

   ℹ️  Configure Kibana to use this cluster:
   • Run Kibana and click the configuration link in the terminal when Kibana starts.
   • Copy the following enrollment token and paste it into Kibana in your browser (valid for the next 30 minutes):
     eyJ2ZXIiOiI4Lj...the enrollment token...GcifQ==

   ℹ️ Configure other nodes to join this cluster:
   • Copy the following enrollment token and start new Elasticsearch nodes with `bin/elasticsearch --enrollment-token <token>` (valid for the next 30 minutes):
     eyJ2ZXIiOiI4Lj...the enrollment token...GcifQ==

     If you're running in Docker, copy the enrollment token and run:
     `docker run -e "ENROLLMENT_TOKEN=<token>" docker.elastic.co/elasticsearch/elasticsearch:8.8.2`
   ```

4. Now copy the **enrollment token** and the **Elasticsearch password** to a safe place for future use.
5. In a new terminal, run the next file:
   ```bash
   bash ./docker-run2.sh
   ```
6. This will spin up Kibana and start printing the logs. Wait until you get the URL for Kibana's dashboard with a one-time code. The URL will look something like this: `http://0.0.0.0:5601/login?code=12345`
7. Use the URL with the login code to open Kibana, and use the **enrollment token** and **Elasticsearch password** to log in and finalize the Kibana setup.
8. Now, run the next script to start the last remaining container.
   ```bash
   bash ./docker-run3.sh
   ```
9. After everything is done, we need to update the configuration of the OnlyOffice container to make sure that it is able to connect with our document-storage-service. Follow these steps to ensure that:
   1. Open your Docker Desktop and click on the `onlyoffice` container. Then choose the `Exec` tab. For Linux users, run `docker exec -it sequesto-onlyoffice bash`
   2. Open the target file with **nano** by running:
      ```bash
      nano /etc/onlyoffice/documentserver/local.json
      ```
   3. There, you'll notice a field named **"CoAuthoring"**. We need to paste the following code within that field:
      ```json
      "request-filtering-agent": {
        "allowPrivateIPAddress": true,
        "allowMetaIPAddress": true
      },
      ```
   4. Now restart your **sequesto-onlyoffice** container to make the changes take effect.
10.

With that, you're done setting up the Docker containers for Sequesto.

## Fixes

### Kibana is not loading

If Kibana starts to behave oddly and says that Kibana is not ready when you open 0.0.0.0:5601 in your browser, then run the `./docker-fix-kibana.sh` script to fix the issue.

```bash
bash ./docker-fix-kibana.sh
```
