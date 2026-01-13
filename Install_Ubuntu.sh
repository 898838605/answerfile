# 启动安装程序（适配 headless 版 QEMU，纯文本界面）
qemu-system-x86_64 \
  -m 1024 \          # 分配 1GB 内存（手机内存≥4GB 可改 2048）
  -cpu qemu64 \      # 适配安卓的 CPU 架构
  -cdrom ubuntu-22.04.4-live-server-amd64.iso \  # 挂载 ISO 镜像
  -hda ubuntu-docker.img \  # 安装目标镜像文件
  -boot d \          # 优先从光盘（ISO）启动
  -nographic \       # 纯命令行（必加，适配 headless 版 QEMU）
  -smp cores=1 \     # 分配 1 核 CPU（避免手机卡顿）
  -machine type=pc,accel=tcg \  # 安卓仅支持的加速模式
  -net nic -net user \  # 配置网络（能上网即可）
  -rtc base=utc     # 时间同步
