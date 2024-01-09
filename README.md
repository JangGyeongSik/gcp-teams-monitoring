# gcp-teams-monitoring

Clone the source from the github link and import it.
```code
git clone https://github.com/JangGyeongSik/gcp-teams-monitoring.git
```
After that, create a Teams Webhook through the attached link.

https://learn.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook?WT.mc_id=m365-12509-rwilliams


Edit the .env.yaml File as follows.

TEAMS_WEBHOOK_URL is the previously issued URL.

AUTH_TOKEN specifies an arbitrary value.
```
TEAMS_WEBHOOK_URL: [TEAMS_WEBHOOK_URL]
AUTH_TOKEN: gyeongsik_jang
```

Then, deploy the Cloud Function through the ShellFile below.

In the case of Service Account, you must be granted the following permissions in advance.
    
- Monitoring Metrics Writer, Logs Writer
```
gcloud functions deploy gcp-monitoring-teams-trigger \
    --entry-point=F \
    --memory=256MB \
    --region=asia-northeast3 \
    --runtime=go120 \
    --env-vars-file=env.yaml \
    --trigger-http \
    --timeout=10s \
    --service-account=[SERVICE_ACCOUNT]
```
Create the generated Trigger URL as Monitoring Notification Channel as shown below.

Auth_Token value should be entered at the end of the URL.

```
https://[Cloud_Function_Trigger_URL]?auth_token=gyeongsik_jang
```
With this setup, you can check the Test Connection in Teams as follows.
[![enter image description here][1]][1]



[1]: https://i.stack.imgur.com/WBaH8.png
----
# Reference Link
* https://stackoverflow.com/questions/69400570/gcp-monitoring-alert-notification-channel-web-hook-with-ms-teams
