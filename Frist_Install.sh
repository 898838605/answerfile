qemu-system-x86_64 -machine q35 -m 2048 -smp cpus=2 -cpu qemu64 \
-drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
-netdev user,id=n1,hostfwd=tcp::2222-:22 \
-device virtio-net,netdev=n1 \
-cdrom alpine-virt-3.12.3-x86_64.iso \
-drive file=alpine.img,if=virtio \
-nographic
#qemu-system-x86_64启动虚拟机，参数为：
#-machine q35：设定机型
#-m 2048：分配 2 GB 内存
#-smp cpus=2：设定 2 个 CPU 核心
#-cpu qemu64：使用 qemu64 CPU 模拟
#-drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd ：加载 UEFI 固件
#-netdev user,id=n1,hostfwd=tcp::2222-:22：将 QEMU 的 22 端口映射到主机的 2222 端口，方便 SSH 连接
#-device virtio-net,netdev=n1：启用 virtio 网络设备
#-cdrom alpine-virt-3.12.3-x86_64.iso：挂载 Alpine 安装 ISO 文件
#-drive file=alpine.img,if=virtio：把本地文件 alpine.img 作为一块 virtio 硬盘挂给虚拟机，用来安装和运行 Alpine。
#-nographic 无图形界面，使用终端输入
