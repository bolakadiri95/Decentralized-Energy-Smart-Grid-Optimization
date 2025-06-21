# Decentralized Energy Smart Grid Optimization

A comprehensive smart contract system for managing and optimizing decentralized energy grids using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a complete solution for smart grid management with the following key components:

- **Grid Operator Verification**: Validates and manages smart grid operators
- **Load Balancing**: Manages electrical grid loads across different zones
- **Demand Response**: Coordinates demand response programs with consumer incentives
- **Storage Coordination**: Manages energy storage systems for grid stability
- **Efficiency Optimization**: Optimizes overall grid efficiency through various metrics

## Architecture

### Smart Contracts

1. **grid-operator-verification.clar**
    - Verifies grid operators and manages permissions
    - Tracks operator capabilities and regional assignments
    - Provides authorization for other contract operations

2. **load-balancing.clar**
    - Manages grid zones and load distribution
    - Handles emergency load shedding
    - Tracks load adjustments and grid frequency

3. **demand-response.clar**
    - Creates and manages demand response programs
    - Handles consumer participation and incentives
    - Tracks demand reduction achievements

4. **storage-coordination.clar**
    - Registers and manages energy storage systems
    - Coordinates charging and discharging operations
    - Optimizes storage for grid balancing

5. **efficiency-optimization.clar**
    - Records and analyzes efficiency metrics
    - Implements optimization actions
    - Provides automated optimization recommendations

## Key Features

### Grid Operator Management
- Operator verification and permission system
- Regional capacity tracking
- Multi-level authorization controls

### Load Management
- Zone-based load balancing
- Real-time capacity monitoring
- Emergency response capabilities

### Demand Response
- Incentive-based demand reduction programs
- Consumer profile management
- Performance tracking and rewards

### Energy Storage
- Multi-type storage system support
- Coordinated charge/discharge operations
- Grid balancing integration

### Efficiency Optimization
- Comprehensive efficiency metrics
- Component-level optimization tracking
- Automated improvement recommendations

## Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository
   \`\`\`bash
   git clone <repository-url>
   cd smart-grid-optimization
   \`\`\`

2. Install dependencies
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts in the following order:
1. grid-operator-verification.clar
2. load-balancing.clar
3. demand-response.clar
4. storage-coordination.clar
5. efficiency-optimization.clar

## Usage Examples

### Verifying a Grid Operator
\`\`\`clarity
(contract-call? .grid-operator-verification verify-operator
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
"transmission-operator"
u5000  ;; 5000 MW capacity
"northeast-region")
\`\`\`

### Creating a Demand Response Program
\`\`\`clarity
(contract-call? .demand-response create-demand-program
"Peak Hour Reduction Program"
u1000  ;; 1000 MW target reduction
u50    ;; 50 tokens per MW reduced
u144)  ;; 144 blocks duration
\`\`\`

### Registering Energy Storage
\`\`\`clarity
(contract-call? .storage-coordination register-storage-system
"lithium-ion-battery"
u2000  ;; 2000 MWh capacity
u500   ;; 500 MW charge rate
u500   ;; 500 MW discharge rate
u95    ;; 95% efficiency
"central-hub")
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm run test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Operator verification workflows
- Load balancing operations
- Demand response program lifecycle
- Storage coordination functions
- Efficiency optimization algorithms

## API Reference

### Grid Operator Verification
- \`verify-operator\`: Add a new verified operator
- \`revoke-operator\`: Remove operator verification
- \`is-verified-operator\`: Check operator status
- \`get-operator-details\`: Get operator information

### Load Balancing
- \`initialize-zone\`: Create a new grid zone
- \`adjust-zone-load\`: Modify zone load
- \`emergency-load-shed\`: Emergency load reduction
- \`get-zone-status\`: Get zone information

### Demand Response
- \`create-demand-program\`: Create new DR program
- \`register-consumer\`: Register consumer profile
- \`participate-in-program\`: Join DR program
- \`report-actual-reduction\`: Report demand reduction

### Storage Coordination
- \`register-storage-system\`: Add storage system
- \`charge-storage\`: Charge storage system
- \`discharge-storage\`: Discharge storage system
- \`coordinate-grid-balancing\`: Grid balancing coordination

### Efficiency Optimization
- \`record-efficiency-metrics\`: Record efficiency data
- \`register-grid-component\`: Add grid component
- \`implement-optimization\`: Apply optimization action
- \`auto-optimize-grid\`: Automated optimization

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.
