import boto3
import json
import os
import hashlib
from datetime import datetime, timedelta

dynamodb = boto3.resource('dynamodb')
table_name = os.environ.get('TABLE_NAME', 'Cloud-Resume-Challenge-visit-counter')
table = dynamodb.Table(table_name)

UNIQUE_WINDOW_HOURS = 24

def hash_ip(ip):
    """Turn the IP into a one-way scrambled code."""
    return hashlib.sha256(ip.encode()).hexdigest()


def lambda_handler(event, context):
    counter_id = 'site_visits'

    source_ip = (
        event.get('requestContext', {})
        .get('identity', {})
        .get('sourceIp')
    )

    hashed_ip = "ip#" + hash_ip(source_ip)
    now = datetime.utcnow()
    cutoff_time = now - timedelta(hours=UNIQUE_WINDOW_HOURS)

    resp = table.get_item(Key={'counter_id': hashed_ip})
    item = resp.get("Item")
    
    is_new_unique = True
    if item and "last_visit" in item:
        last_time = datetime.fromisoformat(item["last_visit"])
        if last_time > cutoff_time:
            is_new_unique = False
    
    if is_new_unique:
        # Update the unique visitor record
        table.put_item(Item={
            "counter_id": hashed_ip,
            "last_visit": now.isoformat()
        })

        total_resp = table.get_item(Key={"counter_id": "total"})
        current_total = total_resp.get("Item", {}).get("visits", 0)

        new_total = current_total + 1

        table.put_item(Item={
            "counter_id": "total",
            "visits": new_total
        })

    else:
        # If not new → just read total
        total_resp = table.get_item(Key={"counter_id": "total"})
        new_total = total_resp.get("Item", {}).get("visits", 0)

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps({
            "visits": int(new_total),
            "unique": is_new_unique
        })
    }