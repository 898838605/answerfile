qemu-system-x86_64 -machine q35 -m 2048 -smp cpus=2 -cpu qemu64 \
-drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
-netdev user,id=n1,hostfwd=tcp::2222-:22,hostfwd=tcp::8888-:8080 \
-device virtio-net,netdev=n1 \
-nographic alpine.img
#添加了8888端口映射到虚拟机的8080, 用于HTTP服務, 若有其他需要可自行添加相关端口
