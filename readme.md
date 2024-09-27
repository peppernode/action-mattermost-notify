# Mattermost notify action
Simple and fast bash script for mattermost notification

## Action fields
| Field       | Required | Description                                  |
|-------------|----------|----------------------------------------------|
| webhook_url | true     | Mattermost webhook url                       |
| message     | true     | Message to send                              |
| username    | false    | Overrides the username the message posts as  |
| channel     | false    | Overrides the channel the message posts in   |

## Usage example
### Mattermost notify action
```yaml
on: [ push ]

jobs:
  mattermost_notify:
    runs-on: ubuntu-latest
    
    steps:
      - name: Send notification to mattermost
        uses: peppernode/action-mattermost-notify@v0.2.0
        with:
          webhook_url: ${{ secrets.MATTERMOST_WEBHOOK_URL }}
          message: "My message to send to mattermost :tada:"
```
### Mattermost notify action with username and channel
```yaml
on: [ push ]

jobs:
  mattermost_notify:
    runs-on: ubuntu-latest
    
    steps:
      - name: Send notification to mattermost
        uses: peppernode/action-mattermost-notify@v0.2.0
        with:
          webhook_url: ${{ secrets.MATTERMOST_WEBHOOK_URL }}
          message: "My message to send to mattermost :tada:"
          username: "MyUsername"
          channel: "MyChannel"
```
