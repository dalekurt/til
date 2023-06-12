# Delete Pods in the 'Terminating' State

For Pods on Kubernetes stubbornly stuck in the state of ‘Terminating’.

If we want to fix this, we have to use some force. The command given below always helps me, it removes it almost immediately.

```shell
kubectl delete pods <POD NAME> -n <NAMESPACE>  --grace-period=0 --force
```