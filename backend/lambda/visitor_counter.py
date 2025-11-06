import boto3
import json
import os

dynamodb = boto3.resource('dynamodb')
table_name = os.environ.get('TABLE_NAME', 'Cloud-Resume-Challenge-visit-counter')
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    counter_id = 'site_visits'

    try:
        response = table.get_item(Key={'counter_id': counter_id})
        current_count = response.get('Item', {}).get('visits', 0)

        new_count = current_count + 1

        table.put_item(Item={'counter_id': counter_id, 'visits': new_count})

        return {
            'statusCode': 200,
            'headers': {'Content-Type': 'application/json', 
                        'Access-Control-Allow-Origin': '*',
                        'Access-Control-Allow-Methods': 'GET, OPTIONS',
                        'Access-Control-Allow-Headers': 'Content-Type'},
            'body': json.dumps({'visits': int(new_count)})
        }

    except Exception as e:
        print(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }