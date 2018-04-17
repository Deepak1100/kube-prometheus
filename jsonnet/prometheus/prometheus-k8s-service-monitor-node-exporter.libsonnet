{
    new(namespace)::
        {
            "apiVersion": "monitoring.coreos.com/v1",
            "kind": "ServiceMonitor",
            "metadata": {
                "name": "node-exporter",
                "namespace": namespace,
                "labels": {
                    "k8s-app": "node-exporter"
                }
            },
            "spec": {
                "jobLabel": "k8s-app",
                "selector": {
                    "matchLabels": {
                        "k8s-app": "node-exporter"
                    }
                },
                "namespaceSelector": {
                    "matchNames": [
                        "monitoring"
                    ]
                },
                "endpoints": [
                    {
                        "port": "https",
                        "scheme": "https",
                        "interval": "30s",
                        "bearerTokenFile": "/var/run/secrets/kubernetes.io/serviceaccount/token",
                        "tlsConfig": {
                            "insecureSkipVerify": true
                        }
                    }
                ]
            }
        }
}
