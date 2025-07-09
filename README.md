# Kubernetes Cluster Setup Vagrant Libvirt

This repository provides a simple way to set up a Kubernetes K3S cluster using Vagrant-libvirt. It is designed for developers and system administrators who want to quickly create a local Kubernetes K3S environment for testing, learning, or development purposes without the need for complex cloud infrastructure.

### Key Features

- **Easy Setup**: With just a command you have a simple K3S cluster.
- **Customization Options**: There are separated varibles to edit in the vagrant file to change number of workers, cpu and ram.
- **Export kube config**: The start command copies the kube config file to the local machine that allows local connection using kubctl. 

## System Prerequisites 📋

Before you begin, ensure your system meets the following prerequisites:
- [Git](https://git-scm.com/downloads) - For version control
- [Vagrant](https://www.vagrantup.com/downloads.html) - Virtual machine management tool
- [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) - To manage the cluster locally outside vm.
- [Libvirt manager](https://libvirt.org/) - Libvirt virtual machine manager
- Hypervisor - Supported Hypervisor like kvm/QEMU
- (*Optional*)[OpenLens](https://github.com/MuhammedKalkan/OpenLens) - Gui for managing and troubleshooting Kubernetes.

## Installation Instructions 🔧

Follow these steps to set up the Kubernetes K3S cluster:

1. **Clone the Repository**: Use the following command to clone the repository:

```bash
git clone https://github.com/fungame2270/kubernetes-K3S-vagrant-libvirt.git
```

2. **Start the Cluster**: Navigate to the cloned repository folder (where the `Scripts` are located "`start.sh`" and "`destroy.sh`") and execute the `start.sh`:

```bash
cd kubernetes-K3S-vagrant-libvirt
./start.sh
```

3. **Destroy the Cluster**: Simply run the `destroy.sh` it will stop the vms and delete the config file and join cluster file:

```bash
./destroy.sh
```

> [!NOTE]  
> The script will ask for sudo permission to change the kube config ownership and permissions. Vagrant will ask too.

## Optional Modifications ⚙️

To increase the number of worker nodes or adjust CPU and RAM, change the `NodeCount`,`CPU` and `Memory` for the master and workers in the variables inside the `Vagrantfile`:

```ruby
Vagrant.configure(2) do |config|
 ...
  NodeCount = 1
  MasterCpu = 4
  MasterMemory = 4096
  WorkerCpu = 2
  WorkerMemory = 4096
 ...
```

## References

- This repository is a derivative work based on [hfmartinez/kubernetes-vagrant](https://github.com/hfmartinez/kubernetes-vagrant)
- Documentation used [K3S docs](https://docs.k3s.io/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
