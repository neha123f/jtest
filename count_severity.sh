#!/bin/bash

# Specify the JSON filename (assuming it exists in the current directory)
json_file="input.json"

# Use jq to count and format severity levels
severity_count=$(jq '[.. | select(.severity?)] | group_by(.severity) | map({severity: .[0].severity, count: length})' "$json_file")

# Use jq to extract the "Trafficlight" value (correct capitalization)
trafficlight_value=$(jq -r '.trafficLight' "$json_file")

# Create a JSON object containing severity count and traffic light
result_json="{\"SeverityCount\": $severity_count, \"Trafficlight\": \"$trafficlight_value\"}"

# Print the JSON result
echo "$result_json"
