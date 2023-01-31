
# Get Pods on Node

To get Pods running on a specific Node in the default Namespace for the current context:

```shell
$ kubectl get pods --field-selector spec.nodeName=<_node_name_>
$ kubectl get pods --field-selector spec.nodeName=<_node_name_> -o wide
```

To list all Pods running on a specific Node in the all Namespaces:

```shell
$ kubectl get pods --field-selector spec.nodeName=<_node_name_> --all-namespaces
$ kubectl get pods --field-selector spec.nodeName=<_node_name_> --all-namespaces -o wide
```