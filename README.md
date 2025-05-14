### Cato Sentinel Connector

To deploy the Cato Sentinel Connector, follow the link below:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcatonetworks%2Fcato-sentinel-connect%2Frefs%2Fheads%2Fmain%2Fcato_deploy.json)

Once run, you will see a screen which asks for some basic details:

![arm deployment](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/cato-sentinel-arm.png?raw=true)

Select the Azure Subscription, Region, and Resource Group that contains your Microsoft Azure Sentinel deployment.

Your Cato Account ID can be found in your CMA Dashboard. You will also need to have a Cato API key created with read capabilities. ![Instructions for create an API key can be found here.](https://support.catonetworks.com/hc/en-us/articles/4413280536081-Generating-API-Keys-for-the-Cato-API)

Next, enter the Microsoft Azure Log Analytics Workspace name associated with your Sentinel deployment. This can be found in the Azure Portal as shown here:

![log analytics workspace](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/az-log-wrks.png?raw=true)

Next, enter a name for the resources to use in the Azure Resource Group. The default can be used or a value of less than 12 characters and greater than 3 can be entered.

We now have some new features added which allow you to determine the information that will be ingested into your Azure Log Analytics Workspace Tables.

**Enable Cato Events** - When set to _True_, data from the Cato Events Feed is sent to the Log Analytics Workspace table **CatoEventEngine_CL**.
**Enable Cato Cef** - When set to _True_, data from the Cato Events Feed is sent to the Log Analytics Workspace table **Custom-CommonSecurityLog**.
**Enable Cato Audit Logs** - When set to _True_, data from the Cato Audit Feed is sent to the Log Analytics Workspace table **CatoAuditEngine_CL**.
**Enable Cato Stories** - When set to _True_, data from Cato XDR Stories is sent to the Log Analytics Workspace table **CatoStoriesEngine_CL**.

**Cato Event Filter** - This is the filter applies to the Cato Event Feed query to limit data retrieved by the Azure FunctionApp and thus ingested into Log Analytics. Some examples can be found below. **Leave empty to retrieve all data.**

Retrieve only _Security_ event types:
```
[{"fieldName":"event_type","operator":"is","values":["Security"]}]
```

Retrieve only _Connectivity_ event types:
```
[{"fieldName":"event_type","operator":"is","values":["Connectivity"]}]
```

Retrieve only _Security_ and _Connectivity_ event types:
```
[{"fieldName":"event_type","operator":"is","values":["Security","Connectivity"]}]
```

Retrieve only event sub types of type _Internet Firewall_:
```
[{"fieldName":"event_sub_type","operator":"is","values":["Internet Firewall"]}]
```

Retrieve only events of type _Security_ with a sub type of _Internet Firewall_:
```
[{"fieldName":"event_type","operator":"is","values":["Security"]},{"fieldName":"event_sub_type","operator":"is","values":["Internet Firewall"]}]
```

Finally, click on Review + Create

## Outcomes

The ARM template deployed creates three custom tables available for query and an Azure FunctionsApp which will load data into the tables. 

By default, the event feed data will be loaded as near realtime. The audit feed data will load data into the tables every 5 minutes and the XDR stories data will be loaded every four hours.

![log analytics table list](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/table-list.png?raw=true)

![log analytics table query](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/table-query.png?raw=true)

The Microsoft CommonSecurityLog table will also be populated as shown:

![log analytics commonsecurity table](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/cef-table.png?raw=true)

![log analytics commonsecurity query](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/cef-query.png?raw=true)

## Visualization

To deploy the Workbook visualization to your Azure account, run the deployment below:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcatonetworks%2Fcato-sentinel-connect%2Frefs%2Fheads%2Fmain%2Fcato_wb_deploy.json)

Upon deployment, you will need to enter the following information:

![log analytics commonsecurity query](https://github.com/catonetworks/cato-sentinel-connect/blob/main/img/wb-deploy.png?raw=true)

Select the Subscription, Resource, and Region where you have deployed your previous template (above).

Decide upon a workbook name to be used for visualization. 

Workbook type can be left as the default along with the workbook ID. 

You will need to enter the same Sentinel Workspace Name the was used above. This will be the Log Analytics Workspace name that contains your Sentinel data.