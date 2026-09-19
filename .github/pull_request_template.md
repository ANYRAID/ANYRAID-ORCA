## 分支与验证

- [ ] 任务 PR 指向 `develop`；晋级 PR 由本仓库 `develop` 指向 `main`。
- [ ] 已说明实际执行的检查，以及跳过或受环境限制的验证。
- [ ] 行为、配置或流程变更已同步项目文档。

# Description

<!--
> Please provide a summary of the changes made in this PR. Include details such as:
  > * What issue does this PR address or fix?
  > * What new features or enhancements does this PR introduce?
  > * Are there any breaking changes or dependencies that need to be considered?
-->

# Screenshots/Recordings/Graphs

<!--
> Please attach relevant screenshots to showcase the UI changes.
> Please attach images that can help explain the changes.
-->

## Tests

<!--
> Please describe the tests that you have conducted to verify the changes made in this PR.
-->

<!--
> A guide for users on how to download the artifacts from this PR.
-->

普通 PR 不运行完整构建，也不保证提供二进制产物。请在 Tests 中记录验证命令和结果；完整构建仅由 nightly 计划或 `v*` 标签触发。
