# Remove a Kubernetes Node

This topic describes how to remove NotReady nodes from a Kubernetes cluster.

## Precautions
-   When you remove a node, the pods that run on the node are migrated to other nodes. This may cause service interruptions. We recommend that you remove nodes during off-peak hours.
-   Unknown errors may occur when you remove nodes. Before you remove nodes, back up the data on the nodes.
-   Nodes remain in the Unschedulable state when they are being removed.
-   You can remove only worker nodes. You cannot remove master nodes.

## Symptoms

After updating the hostname on four virtual machines which are apart of the Kubernetes cluster they resulted in a `NotReady` state

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

## Resolving the problem

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

For the master node, I had to terminate a few pods 

```shell
kubectl get pods -o wide -n kube-system

NAME                                      READY   STATUS        RESTARTS       AGE    IP              NODE                        NOMINATED NODE   READINESS GATES
coredns-7b5bbc6644-9mvfr                  1/1     Running       0              69m    10.42.43.3      worker-0.int.lunarops.net   <none>           <none>
coredns-7b5bbc6644-tv4n4                  1/1     Terminating   0              102m   10.42.36.65     master-0                    <none>           <none>
kube-vip-7r4rv                            1/1     Running       1 (32m ago)    75m    172.16.30.10    master-0.int.lunarops.net   <none>           <none>
kube-vip-sjxbt                            1/1     Terminating   1 (101m ago)   102m   172.16.30.10    master-0                    <none>           <none>
local-path-provisioner-687d6d7765-2bc26   1/1     Running       8 (54m ago)    69m    10.42.133.195   worker-2.int.lunarops.net   <none>           <none>
local-path-provisioner-687d6d7765-tpx96   1/1     Terminating   0              102m   10.42.36.66     master-0                    <none>           <none>
```