# 山东大学硕博士学位论文 LaTeX 模板

面向希望直接填写内容并编译论文的同学。基于 **《山东大学研究生学位论文撰写指南》（2022）** 和 **《2024版学位论文封面（扉页）》**，提供博士、硕士共用的XeLaTeX模板。

**这是非官方模板。** 格式冲突优先遵循所依据的撰写指南；未宣称覆盖之后的所有校方修订。提交前请核对所在学院的适用要求。

[详细使用说明](USAGE.md) · [格式依据](FORMAT.md) · [编译检查记录](VALIDATION.md) · [参与改进](CONTRIBUTING.md)

## 模板包含什么

- 2024版文件中的13种扉页组合，博士／硕士、学位类型和页眉自动联动。
- 封面、扉页、声明、中英文摘要和目录，及附录、参考文献、致谢、科研成果、项目与答辩信息等功能页。
- 第一章使用说明、默认第二章的完整规范，以及六章研究内容占位。
- 中英文图题与表题、图表清单、公式编号、交叉引用、三线表、跨页长表、子图及脚注示例。
- 本地编译脚本、GitHub自动编译配置及可编辑占位内容。

完整发行包附 `example.pdf`，可以先查看再填写；重新编译生成 `main.pdf`。无校徽包以纯文字校名代替校标，不附含校徽的预览。

## 快速开始

1. 下载并解压完整模板，保留目录结构。
2. 安装含中文支持的TeX Live、MacTeX或MiKTeX。
3. 修改 [`metadata.tex`](metadata.tex)，填写学位、姓名、题目、培养单位、导师等信息。
4. Windows双击 `build.bat`；macOS/Linux在模板目录执行：

   ```sh
   sh build.sh
   ```

   也可使用 `latexmk main.tex`。编译器必须为 **XeLaTeX**，参考文献工具为 **BibTeX**。

5. 按 [`USAGE.md`](USAGE.md) 的文件表填写摘要、正文和其他内容，查看输出的 `main.pdf`。

Overleaf可导入完整ZIP，主文件选 `main.tex`、编译器选XeLaTeX；建议使用下文的便携字体模式。云端环境尚未实测，已完成的本地检查见VALIDATION。

## 学位选项

在 `metadata.tex` 中修改已有设置，例如学术硕士：

```latex
\SDUsetup{
  degree-level = master,
  degree-type = academic,
  engineering-type = research
}
```

| 选项 | 可选值 |
|---|---|
| `degree-level` | `doctor` 博士；`master` 硕士 |
| `degree-type` | `academic` 学术；`professional` 专业；`interdisciplinary` 学科交叉；`equivalent` 同等学力 |
| 仅硕士额外类型 | `engineering` 工程硕博士培养改革专项 |
| `engineering-type` | `research` 专题研究；`design` 方案设计；`case` 案例分析；`survey` 调研报告；`product` 产品设计 |

默认示例为专业学位博士。工程专项的五种扉页在所提供文件中均属于硕士，因此不支持博士＋工程专项组合。

合作导师为空时，保留官方扉页的空白填写栏：

```latex
\newcommand\SDUcosupervisor{}
```

填写时修改原有命令，不要重复定义同名字段。培养方式和其他可选页面也在 `metadata.tex` 中设置。

## 正式交稿前必做

**第一章说明和第二章规范不应作为研究正文提交。**

- 将第一章改为自己的绪论。
- 在 `main.tex` 中注释规范插入行：

  ```latex
  % \input{chapters/guide}
  ```

- 替换猫狗图片、示例数据、虚构文献和其他占位内容，填写签名与相关信息。
- 完整重编译，核对目录、引用和最终PDF。

第二章关闭后，后续章节、图表和公式自动重新编号。默认八章；关闭规范后为七章，其中第一章需改写为正式绪论。

## 字体与页面

默认优先使用本机宋体、黑体、楷体及Times New Roman；便携模式使用Fandol和TeX Gyre Termes：

```latex
\documentclass[portable]{sdu-thesis}
```

**本模板未随包附带字体文件**，便携字体由TeX发行版提供。MiKTeX缺失时需安装 `fandol`、`tex-gyre` 等包。替代字体会影响字形、换行和分页；严格核对学校指定字形时应使用合法安装原版字体的环境。

默认双面排版、各章从奇数页开始，因此部分空白偶数页是装订所需。所有非空编号页使用随学位层次切换的校名页眉。其他页面选项见USAGE。

## 常用文件

| 文件 | 用途 |
|---|---|
| `main.tex` | 主文件、各部分顺序和规范插入行 |
| `metadata.tex` | 学位选项及个人信息 |
| `frontmatter/` | 声明、摘要、符号与缩略词 |
| `chapters/ch01.tex` | 使用说明，正式写作时改为绪论 |
| `chapters/guide.tex` | 默认第二章规范 |
| `chapters/ch02.tex`—`ch07.tex` | 六章研究内容占位 |
| `figures/`、`references.bib` | 图片与参考文献 |
| `backmatter/` | 附录、致谢、成果、项目和答辩信息 |
| `sdu-thesis.cls` | 排版实现，一般无需修改 |

## 问题反馈与许可

报告问题时请提供版本、编译环境、最小复现示例及首条报错；格式争议请附适用条款。请勿上传完整个人论文、签名或未公开数据，详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

原创代码与占位绘图采用 [MIT许可](LICENSE)。学校标识、规范与声明文字、第三方参考文献宏包各自保留原有权利，详见 [THIRD-PARTY.md](THIRD-PARTY.md)。MIT许可不覆盖这些材料。

维护者发布说明和可复制的发行文案见 [RELEASE.md](RELEASE.md)。
