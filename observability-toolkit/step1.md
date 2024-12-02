# Installation

1. Clone the repository

   ```bash
   git clone https://github.com/cbos/observability-toolkit.git
   ```{{exec}}

1. Navigate to the `observability-toolkit`{{copy}} directory

   ```bash
   cd observability-toolkit
   ```{{exec}}

1. Spin up the Observability toolkit using Docker Compose

   ```bash
   docker compose up -d
   ```{{exec}}
   
   OR use the `just` command
   ```bash
   just up
   ```{{exec}}

The Observability toolkit is now started.
You can open Grafana by opening  [http://localhost:3000]({{TRAFFIC_HOST1_3000}})