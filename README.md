<div align="center">

<picture>
  <img alt="ANYRAID 标志" src="resources/images/ANYRAID-logo-with-word.png" width="24%">
</picture>

[![项目仓库](https://img.shields.io/badge/GitHub-ANYRAID--ORCA-181717?style=flat&logo=github&logoColor=white)](https://github.com/ANYRAID/ANYRAID-ORCA)

</div>

# ANYRAID-ORCA

ANYRAID-ORCA 是一款开源 3D 打印切片软件，帮助你将三维模型转换为打印机可执行的打印文件。你可以选择打印机和耗材预设，调整打印参数，生成并预览切片结果，再将文件发送到兼容的打印机。

## 主要功能

- **打印校准**：提供温度塔、流量、回抽和压力提前等校准工具。
- **外墙与接缝控制**：支持外墙间距调整、斜接缝和墙体打印顺序设置，改善表面质量。
- **填充与孔洞优化**：提供多种填充方式和多边形孔洞补偿选项。
- **悬垂与支撑优化**：支持树状支撑和支撑位置调整，适应复杂模型。
- **精细参数设置**：调整速度、层高、温度及挤出参数，适配不同材料和打印需求。
- **首层附着辅助**：支持鼠耳边缘和自适应热床网格等功能，具体可用能力取决于打印机配置。
- **多种打印机预设**：内置 ANYRAID 鸿影系列及其他品牌的打印机预设。
- **网络打印**：支持连接用户配置的 Klipper、PrusaLink、OctoPrint 等兼容打印服务。

功能变化和修复内容请查看[版本说明](https://github.com/ANYRAID/ANYRAID-ORCA/releases)。

## 下载

请从 [ANYRAID-ORCA 发布页面](https://github.com/ANYRAID/ANYRAID-ORCA/releases)选择适合操作系统和处理器架构的安装包，可用版本及文件以发布页面为准。

- **稳定版**：适合日常使用，优先选择未标记为预发布的版本。
- **每日测试版**：用于体验近期改动，可能存在尚未修复的问题。可在[每日测试版页面](https://github.com/ANYRAID/ANYRAID-ORCA/releases/tag/nightly-builds)查看可用文件。

当前支持 Windows 和 Linux，暂不提供 macOS 安装包。

## 安装与启动

### Windows 系统

下载与处理器架构匹配的安装程序，按提示完成安装。若发布页面提供便携版，也可以解压后启动。

如果无法启动，或部分内置页面无法正常显示，请按需安装相应组件：

- [Microsoft Edge WebView2 运行时](https://aka.ms/webview2)。
- Microsoft Visual C++ 运行库：[x64 版本](https://aka.ms/vs/17/release/vc_redist.x64.exe)或 [ARM64 版本](https://aka.ms/vs/17/release/vc_redist.arm64.exe)，请选择与安装包架构匹配的版本。

目前没有官方 Microsoft Store 或 WinGet 安装渠道。

### Linux 系统

#### AppImage 安装包

下载与处理器架构匹配的 AppImage 文件。赋予执行权限后启动，将下方路径替换为实际文件路径：

```shell
chmod +x /path/to/ANYRAID-ORCA_Linux.AppImage
/path/to/ANYRAID-ORCA_Linux.AppImage
```

#### Flatpak 安装包

如果发布页面提供 Flatpak 安装包，可在已安装 Flatpak 的系统中执行以下命令，将路径替换为实际文件路径：

```shell
flatpak install --user /path/to/ANYRAID-ORCA.flatpak
flatpak run com.anyraid.anyraidorca
```

## 开始使用

1. 启动软件，选择与你的打印机、喷嘴和耗材相符的预设。
2. 导入三维模型，调整摆放方向、层高、填充和支撑等参数。
3. 执行切片，在预览中检查打印路径、支撑和首层。
4. 导出打印文件，或通过已配置的兼容打印服务发送到打印机。

更换耗材或打印头后，建议先完成相应校准，再进行正式打印。

## 联网功能说明

本地切片可以离线使用。当前默认关闭 OrcaSlicer 提供的在线版本检查、预设更新、账号、云同步和插件服务；你仍可手动下载新版本，并连接自行配置的兼容第三方打印服务。

## Klipper 打印机设置

如需使用对象排除和圆弧指令功能，请确认打印机的 `printer.cfg` 中包含以下配置。已有相同配置段时无需重复添加：

```gcode
# 启用对象排除
[exclude_object]

# 启用圆弧指令支持
[gcode_arcs]
resolution: 0.1
```

## 问题反馈

遇到问题时，可在[问题反馈页面](https://github.com/ANYRAID/ANYRAID-ORCA/issues)提交软件版本、操作系统、打印机型号及复现步骤。截图或不含敏感信息的示例模型有助于定位问题。

## 开源来源与致谢

本项目衍生自 [OrcaSlicer](https://github.com/OrcaSlicer/OrcaSlicer)，保留上游版权、许可证和第三方归属声明，感谢上游贡献者、赞助商和支持者。

开源切片软件的发展凝聚了多个项目的成果：[Slic3r](https://github.com/Slic3r/Slic3r) 由 Alessandro Ranellucci 和 RepRap 社区奠定基础；[PrusaSlicer](https://github.com/prusa3d/PrusaSlicer) 在此基础上发展；[Bambu Studio](https://github.com/bambulab/BambuStudio) 和 [SuperSlicer](https://github.com/supermerill/SuperSlicer) 延续并拓展了相关功能。OrcaSlicer 也融合了 CuraSlicer 等项目的理念与成果，进一步发展了校准、接缝、树状支撑和自适应切片等功能。

OrcaSlicer 标志由社区成员 [Justin Levine](https://github.com/jal-co) 设计。

### 上游赞助商

<table>
<tr>
<td>
<a href="https://qidi3d.com/">
  <img src="SoftFever_doc/sponsor_logos/QIDI.png" alt="上游赞助商 QIDI" width="100" height="100">
</a>
</td>
<td>
<a href="https://bigtree-tech.com/">
  <img src="SoftFever_doc/sponsor_logos/BigTreeTech.png" alt="上游赞助商 BIGTREE TECH" width="100" height="100">
</a>
</td>
</tr>
</table>

### 支持上游项目

- [通过 GitHub 赞助](https://github.com/sponsors/SoftFever)
- [通过 Ko-fi 支持](https://ko-fi.com/G2G5IP3CP)
- [通过 PayPal 支持](https://paypal.me/softfever3d)
- [查看 Ko-fi 支持者名单](https://github.com/user-attachments/files/16147016/Supporters_638561417699952499.csv)

## 许可证

OrcaSlicer 和 ANYRAID-ORCA 采用 GNU Affero 通用公共许可证第 3 版（AGPLv3）。完整条款见 [LICENSE.txt](LICENSE.txt)，第三方组件声明也可在应用内查看。

- 压力提前校准图案衍生自 Andrew Ellis 的 GPLv3 生成器，该生成器又改编自 Sineos 的 Marlin 生成器。
- 可选的 Bambu 网络插件基于 Bambu Lab 的非自由软件库，为兼容打印机提供扩展功能。
