# Product Recommender Demo


## Prerequisites
Initial setup should be completed before installing the services for product-recommender

## Using the Development Container
1. Update the .env variables at ```./demos/product-recommender/.env```
2. Execute the given below command.
```
./demos/product-recommender/install.sh 
```

### Example Usage
1. Use this URL http://localhost:8080/ to open arc-view web.
2. Go to setting and update tenantId = globex in system context.
```
System Context
{
  "entries": [
    {
      "key": "tenantId",
      "value": "globex"
    },
    {
      "key": "channelId",
      "value": "web"
    }
```
Start Communication
```
I am looking for a TV that fits an 8x10 ft wall with minimal sunlight exposure and offers good 360-degree sound quality.
```
