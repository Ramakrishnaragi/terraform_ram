import boto3

def lambda_handler(event, context):
    # Initialize EC2 client
    ec2_client = boto3.client('ec2')

    # Define instance parameters
    instance_params = {
        'ImageId': 'ami-0fd05997b4dff7aac',  # Use your AMI ID here
        'InstanceType': 't2.micro',        # Choose the desired instance type
        'MinCount': 1,                     # Minimum number of instances
        'MaxCount': 1,                     # Maximum number of instances
        'KeyName': 'your-key-pair',        # Your SSH key pair
    }
    
    try:
        # Launch EC2 instance
        response = ec2_client.run_instances(**instance_params)
        print("EC2 Instance Launched: ", response)
        
        # Optionally, return instance details to the caller
        return {
            'statusCode': 200,
            'body': f"Instance ID: {response['Instances'][0]['InstanceId']}"
        }
    
    except Exception as e:
        print(f"Error launching EC2 instance: {str(e)}")
        return {
            'statusCode': 500,
            'body': f"Error: {str(e)}"
        }
