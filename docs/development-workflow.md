# 开发与分支流程

本仓库采用 **任务分支 → `develop` → `main`**。`main` 是默认发布分支，`develop` 是集成分支；不另建长期发布分支或远程测试环境。

## 开发与合并

1. 获取最新远程状态，确认工作区干净，保留所有已有改动。
2. 从最新 `origin/develop` 创建任务分支及独立工作树，例如：

   ```bash
   git fetch origin
   git worktree add ../anyraid-orca-task -b feat/example origin/develop
   ```

3. 在任务工作树修改代码及对应文档，按风险完成本机验证。提交主题和正文使用中文。
4. 创建任务分支到 `develop` 的 PR，检查通过后合并。供应商预设合并机器人也只接受 `develop`，必需的 `Check profiles` 结果必须为 `success`，不能以跳过代替验证。
5. `develop` 合并后运行 `Repository checks`。修复通过新的任务 PR 返回 `develop`，不得在共享分支直接开发。
6. 集成验证通过后，由本仓库 `develop` 创建到 `main` 的晋级 PR；使用 **merge commit** 保留提交祖先关系，不对晋级使用 squash 或 rebase。主线 PR 检查通过后合并。
7. 获取远程状态后将本地共享分支快进到对应远程分支。需要把主线合并提交同步回 `develop` 时，在独立同步任务分支合入 `origin/main`，再经 PR 返回 `develop`；禁止重置、强推共享分支。

## 验证范围

- `Branch policy`：任务 PR 指向 `develop`；`main` 只接受同一仓库的 `develop` 晋级 PR，拒绝外部仓库同名分支。
- `Repository checks`：在面向 `develop`、`main` 的 PR 和 `develop` 推送上执行 Python 预设工具测试、全量预设 JSON 与标识符检查。没有路径过滤，适合作为固定的必需检查。
- 翻译和原生预设校验工作流的 PR 目标同时覆盖 `develop`、`main`；Shellcheck 保持原有路径触发方式。
- 原生 `Check profiles` 因缺少 ANYRAID 校验器产物仍暂停，因此供应商自动合并也保持阻塞。Python 校验不能替代原生预设继承、G-code 展开和实际切片验证。
- C++、切片行为或 GUI 变更按 `AGENTS.md` 和 `tests/README.md` 完成适用构建、Catch2、实际切片或交互验证。未执行的验证必须在 PR 中列明，不能将轻量检查通过描述为完整构建通过。
- 纯文档或工作流变更检查内容、链接、格式和受影响工作流逻辑；本次不新增远程测试环境。

## GitHub 分支保护

仓库文件中的工作流不等于服务器端强制保护。管理员应为 `develop`、`main` 启用规则集或分支保护：

- 要求通过 PR 合并，禁止强制推送和删除共享分支。
- 要求 `Branch policy`、`Repository checks` 成功；建议使用 GitHub Actions 作为检查来源。
- 不将带路径过滤或当前停用的检查设为全仓库必需检查；相关变更仍须完成其适用验证。
- 分支策略检查采用普通 `pull_request`，不会阻止有绕过权限的管理员直接推送。保护设置与绕过权限需要在 GitHub 单独核验，不能仅凭此文档声称已启用。

## 构建与发布边界

保持既有交付策略：完整 `Build all` 仅由每日 nightly 计划或 `v*` 标签触发，普通 PR、任务分支和 `develop` 推送不触发完整构建。Windows 与 Linux 为当前交付平台，macOS 继续暂停。

版本标签应基于完成晋级和规定验证的 `main` 提交。配置分支流程不构成创建标签、发布安装包或生产部署的授权；正式发布继续遵循已有发布流程与授权范围。
