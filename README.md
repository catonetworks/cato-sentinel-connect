### Cato Sentinel Connector

To deploy the Cato Sentinel Connector, follow the link below:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fcato-pub.s3.us-west-2.amazonaws.com%2FeventEngine%2Fcato_deploy.json)

Once run, you will see a screen which asks for some basic details:

![arm deployment](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/cato-sentinel-deploy.png?raw=true)

Select the Azure Subscription, Region, and Resource Group that contains your Microsoft Azure Sentinel deployment.

Your Cato Account ID can be found in your CMA Dashboard. You will also need to have a Cato API key created with read capabilities. 

Next, enter the Microsoft Azure Log Analytics Workspace name associated with your Sentinel deployment. This can be found in the Azure Portal as shown here:

![log analytics workspace](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/az-log-wrks.png?raw=true)

Next, enter a name for the resources to use in the Azure Resource Group. The default can be used or a value of less than 12 characters and greater than 3 can be entered.

Finally, click on Review + Create