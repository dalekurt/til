# Remove a Kubernetes Node

This topic describes how to remove NotReady nodes from a Kubernetes cluster.

## Precautions
-   When you remove a node, the pods that run on the node are migrated to other nodes. This may cause service interruptions. We recommend that you remove nodes during off-peak hours.
-   Unknown errors may occur when you remove nodes. Before you remove nodes, back up the data on the nodes.
-   Nodes remain in the Unschedulable state when they are being removed.
-   You can remove only worker nodes. You cannot remove master nodes.
- 
## Issue

I updated the hostnames on a few Kubernetes node in order to make them consistent having a Fully Qualified Domain Name (FQDN), however that change resulted in having ghost nodes which no longer existing in the cluster. Which resulted in the following output from `kubectl get nodes`

```shell
$ kubectl get nodes
NAME                        STATUS                        ROLES                       AGE   VERSION
master-0                    NotReady,SchedulingDisabled   control-plane,etcd,master   44m   v1.24.8+k3s1
master-0.int.lunarops.net   Ready                         control-plane,etcd,master   17m   v1.24.8+k3s1
worker-0                    NotReady                      <none>                      42m   v1.24.8+k3s1
worker-0.int.lunarops.net   Ready                         <none>                      17m   v1.24.8+k3s1
worker-1                    NotReady                      <none>                      42m   v1.24.8+k3s1
worker-1.int.lunarops.net   Ready                         <none>                      17m   v1.24.8+k3s1
worker-2                    NotReady                      <none>                      42m   v1.24.8+k3s1
worker-2.int.lunarops.net   Ready                         <none>                      17m   v1.24.8+k3s1
worker-3.int.lunarops.net   Ready                         <none>                      42m   v1.24.8+k3s1
worker-4.int.lunarops.net   Ready                         <none>                      42m   v1.24.8+k3s1
worker-5.int.lunarops.net   Ready                         <none>                      42m   v1.24.8+k3s1
worker-6.int.lunarops.net   Ready                         <none>                      42m   v1.24.8+k3s1
```

## Solution

Mark the Node as unschedulable to prevent new pods from being assigned to it:
```shell
kubectl cordone <node name>
```

Next, tell Kubernetes to drain the node:
```shell
kubectl drain --ignore-daemonsets --force <node name>
```

Remove the Kubernetes Node:
```shell
kubectl delete node <node_ID>
```