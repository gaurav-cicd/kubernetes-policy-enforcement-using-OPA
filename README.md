# Kubernetes Policy Enforcement using OPA

This project demonstrates how to implement automated policy enforcement in Kubernetes clusters using Open Policy Agent (OPA) and Gatekeeper.

## Overview

This project implements security best practices in Kubernetes by:
- Preventing privileged containers
- Enforcing resource limits
- Restricting container capabilities
- Implementing network policies
- Generating compliance reports

## Prerequisites

- Kubernetes cluster (v1.19+)
- kubectl configured
- Helm v3.x
- OPA Gatekeeper v3.x

## Project Structure

```
.
├── README.md
├── policies/                    # OPA Rego policies
│   ├── privileged-containers.rego
│   ├── resource-limits.rego
│   └── container-capabilities.rego
├── manifests/                   # Kubernetes manifests
│   ├── gatekeeper/             # Gatekeeper installation
│   ├── constraints/            # Constraint templates
│   └── constraint-bindings/    # Constraint bindings
└── monitoring/                 # Monitoring and reporting
    └── dashboard/             # Grafana dashboard
```

## Installation

1. Install OPA Gatekeeper:
```bash
kubectl apply -f manifests/gatekeeper/
```

2. Apply constraint templates:
```bash
kubectl apply -f manifests/constraints/
```

3. Apply constraint bindings:
```bash
kubectl apply -f manifests/constraint-bindings/
```

## Policy Enforcement

The project implements the following policies:

1. **Privileged Containers**: Prevents deployment of privileged containers
2. **Resource Limits**: Enforces CPU and memory limits on all containers
3. **Container Capabilities**: Restricts container capabilities to a minimal set
4. **Network Policies**: Implements default deny network policies

## Monitoring and Reporting

The project includes a Grafana dashboard for monitoring policy violations and compliance status.

## Usage

1. Deploy the policies:
```bash
kubectl apply -f manifests/
```

2. Monitor violations:
```bash
kubectl get constrainttemplates
kubectl get constraints
```

3. View violation reports:
```bash
kubectl get constraintviolations
```

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details. 