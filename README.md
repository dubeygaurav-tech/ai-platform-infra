AI Inference Platform Infrastructure

This repository defines the infrastructure-as-code for a scalable, Kubernetes-native AI model serving platform. It utilizes GitOps principles to manage the deployment of high-performance inference engines.
Overview

This platform is designed to serve Large Language Models (LLMs) using vLLM. It provides a clean, resource-constrained environment for model inference within a Kubernetes cluster.
Architecture

    Namespace: ai-workloads — Isolates AI workloads from standard application services.  

    Serving Engine: vLLM — An optimized engine for high-throughput and low-latency LLM serving.

    Deployment Strategy: Declarative Kubernetes manifests managed via GitOps.

Resource Constraints

To ensure cluster stability and prevent resource starvation, the following constraints are enforced:

    Requests: 1 CPU, 2Gi Memory (Guaranteed capacity).  

    Limits: 2 CPU, 4Gi Memory (Hard ceiling to prevent OOM events).  

Prerequisites

    A Kubernetes cluster (e.g., Kind or EKS).  

    ArgoCD installed for automated synchronization.  

    NVIDIA Device Plugin (if running on GPU-enabled nodes).