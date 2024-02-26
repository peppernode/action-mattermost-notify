RESPONSE=$(curl -s -w "HTTP_STATUS:%{http_code}" -X POST -H "Content-Type: application/json" -d '{"text": "'"$MESSAGE"'"}' "$WEBHOOK_URL")

# Extract the response body and status code
HTTP_STATUS=$(echo "$RESPONSE" | tr -d '\n' | sed -e 's/.*HTTP_STATUS://')

# Check the HTTP status code
if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "POST request successful. Status code: $HTTP_STATUS"
else
  echo "POST request failed with status code: $HTTP_STATUS"
  BODY=$(echo "$RESPONSE" | sed -e 's/HTTP_STATUS\:.*//')
  echo "Response body: $BODY"
  exit 1
fi