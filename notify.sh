# Escape double quotes in the $MESSAGE variable
escaped_message="${MESSAGE//\"/\\\"}"
escaped_channel="${CHANNEL//\"/\\\"}"
escaped_username="${USERNAME//\"/\\\"}"

json_payload=$(jq -n \
  --arg text "$escaped_message" \
  --arg channel "$escaped_channel" \
  --arg username "$escaped_username" \
  '{text: $text, channel: $channel, username: $username}')

RESPONSE=$(curl -s -w "HTTP_STATUS:%{http_code}" -X POST -H "Content-Type: application/json" -d "$json_payload" "$WEBHOOK_URL")

# Extract the response body and status code
HTTP_STATUS=$(echo "$RESPONSE" | tr -d '\n' | sed -e 's/.*HTTP_STATUS://')

# Check the HTTP status code
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "POST request successful. Status code: $HTTP_STATUS"
else
    echo "POST request failed with status code: $HTTP_STATUS"
    BODY=$(echo "$RESPONSE" | sed -e 's/HTTP_STATUS://')
    echo "Response body: $BODY"
    exit 1
fi
