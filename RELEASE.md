# GitHub发布说明

本文件供仓库维护者发布时使用；学生的入口是 [README.md](README.md)。下列仓库名和版本号为建议，尚未据此建立远程仓库或标签。

## 仓库信息

- 建议仓库名：`sdu-thesis-template`
- 简介：山东大学硕博士学位论文LaTeX模板，支持学位选项、中英文目录、完整功能页及可移除的规范章节。
- 建议Topics：`latex`、`thesis-template`、`xelatex`、`ctex`、`chinese-thesis`
- 对应本次源码版本：`v0.2`。发布标签应与实际发布内容一致。

## 上传内容

推荐解压完整发行ZIP，将解压后的内容作为仓库根目录上传，使 `README.md`、`main.tex` 和 `sdu-thesis.cls` 位于同一层。不要仅将整个ZIP作为仓库中的唯一文件。

保留 `LICENSE`、`THIRD-PARTY.md`、`vendor/` 及已有的字体许可证；保留 `.github/workflows/build.yml` 才能使用已提供的自动编译配置。`example.pdf` 是可选的预览文件，完整发行包自带；无校徽包不附该预览。

不要上传原始个人论文、签名、临时提取资料、个人配置、编译日志和辅助文件。现有 `.gitignore` 会排除常见编译产物。检查实际待上传文件，不要只依赖忽略规则。

若使用无校徽源码包，封面会采用文字占位；README中“完整发行包内有example.pdf”的说明仍适用。不要将含校徽的示例PDF混入标为无校徽的发行包。

## 发布一个版本

1. 核对README所述选项、字体、规范版本与源码一致。
2. 从准备发布的ZIP解压到新目录编译，检查内容、日志和页面。
3. 更新 `VALIDATION.md`，只记录实际完成的检查。
4. 为本次源码建立版本标签，并创建对应的GitHub Release。
5. 将完整ZIP、无校徽ZIP、示例PDF和 `SHA256SUMS.txt` 作为Release附件。只要附件变化，就重新计算校验值。
6. 只有在远程自动编译实际通过后，才使用通过状态的构建徽章；README当前没有未经核实的状态徽章或虚构仓库链接。

## Release说明正文

下面的文字可用作本次发行说明，发布前核对版本号、附件和本次实际检查结果。

---

山东大学硕博士学位论文LaTeX模板 v0.2

本版本支持博士与硕士学位信息配置、中英文摘要与目录、功能页以及图表和公式示例。第一章提供模板依据与使用说明，第二章默认收录学校撰写规范，之后保留六章研究内容占位。

下载完整ZIP后解压，修改 `metadata.tex` 并编译 `main.tex`。Windows可运行 `build.bat`，macOS/Linux可执行 `sh build.sh`。需要XeLaTeX和BibTeX。

正式交稿前，请把第一章说明改写为自己的绪论，并在 `main.tex` 中注释 `\input{chapters/guide}`。重新完整编译后，目录和编号会自动更新。请替换全部占位内容与示例文献。

附件包括：完整源码包、无校徽源码包、`sdu-thesis-example.pdf` 和校验值文件。字体及平台适用范围见README，编译记录见VALIDATION。

本项目为非官方模板。格式依据及处理差异见FORMAT；实际提交以学院适用要求为准。代码与第三方材料的许可范围见LICENSE和THIRD-PARTY。

---
