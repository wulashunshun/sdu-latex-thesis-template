# 山东大学博士、硕士学位论文 LaTeX 模板

v0.2。以同目录《山东大学研究生学位论文撰写指南》（2022）为格式依据，并采用学校《2024版学位论文封面（扉页）》提供的 13 种类型。用户论文只补充规范未规定的细节；存在冲突时以规范为准。本项目为**非官方模板**，不包含原论文正文、个人资料或签名。详见 [FORMAT.md](FORMAT.md)。

## 最快开始

1. 解压整个文件夹，不要只取 `main.tex`。
2. 打开 `metadata.tex`，先选博士／硕士，再选学位类型，然后替换姓名、论文题目、院系、培养方式、导师等内容。
3. 修改 `frontmatter/abstracts.tex` 的中英文摘要，再逐章填写 `chapters/ch01.tex` 至 `ch07.tex`。
4. 编译 `main.tex`，得到 `main.pdf`。第一章为模板使用说明，第二章默认附上规范全文。
5. 正式交稿前，在 `main.tex` 注释 `\input{chapters/guide}`，并把第一章说明改写为自己的绪论。重新编译后目录、章节、图表和公式编号自动更新。

**Overleaf：**新建项目 → 上传项目 ZIP → 主文件选 `main.tex` → 编译器选 **XeLaTeX** → 重新编译。这里没有实测 Overleaf 云端；本地已测试 Windows 字体和便携字体两种模式。首次编译需要生成目录和参考文献，等待自动多轮编译完成。若页码未更新，选择“从头重新编译”。

**Windows：**安装 TeX Live 完整版或 MiKTeX（允许安装缺失宏包），然后双击 `build.bat`。编辑器也可以使用 XeLaTeX → BibTeX → XeLaTeX → XeLaTeX → XeLaTeX。默认不需要 Python、不需要 shell-escape、不需要联网下载图片。

**macOS / Linux：**安装含中文支持的 TeX Live 或 MacTeX，在项目文件夹执行 `sh build.sh`。有 latexmk 时可执行 `latexmk main.tex`。

## 先选学位层次，再选学位类型

所有选项集中在 `metadata.tex`，不需要另找博士或硕士主文件。例如：

```tex
\SDUsetup{
  degree-level = master,
  degree-type = academic,
  engineering-type = research
}
```

上例为“硕士—学术学位”。`engineering-type` 在非工程专项时不显示，可以保持默认值。

| 层次 `degree-level` | 类型 `degree-type` | 扉页括号内显示 |
|---|---|---|
| `doctor` 博士或 `master` 硕士 | `academic` | 学术学位 |
| 博士或硕士 | `professional` | 专业学位 |
| 博士或硕士 | `interdisciplinary` | 学科交叉 |
| 博士或硕士 | `equivalent` | 同等学力申请博士学位／同等学力申请硕士学位 |
| 仅 `master` 硕士 | `engineering` | 工程硕博士培养改革专项 |

工程专项还需选 `engineering-type`：`research` 专题研究类论文、`design` 方案设计、`case` 案例分析报告、`survey` 调研报告、`product` 产品设计（作品创作）。虽然专项名称含“博士”，提供的 2024 文件中这五个封面均是硕士；选择博士＋该专项会报错，避免生成没有依据的扉页。

选择后自动联动中文“博士／硕士学位论文”、英文标题、类型文字和全部非空编号页的页眉。2024 文件中博士校标为黑色、硕士校标为红色，模板沿用对应的原始独立图像。工程专项另显示“学位论文类型”栏，标题前缀改为“题目”。

培养方式填写 `\newcommand\SDUtraining{全日制}`，可改为实际培养方式。

没有合作导师时保持 `\newcommand\SDUcosupervisor{}` 即可；有合作导师则在花括号内填写姓名、职称。空值保留官方表样的空栏和下划线，不印占位名字，也不留多余标点。

## 填写哪些文件

| 文件 | 填写内容 |
|---|---|
| `metadata.tex` | 封面和扉页的信息；图表目录等开关 |
| `frontmatter/abstracts.tex` | 中英文摘要与关键词 |
| `frontmatter/symbols.tex` | 符号、英文缩略词 |
| `chapters/ch01.tex` | 第一章模板依据、配置与使用说明；正式使用时改为自己的绪论 |
| `chapters/guide.tex` | 默认第二章，2022 规范全文及发布通知；正式交稿关闭 |
| `chapters/ch02.tex`—`ch07.tex` | 六章正文占位，章节编号由是否插入规范自动决定 |
| `references.bib` | 真实参考文献，替换两条虚构示例 |
| `backmatter/appendix.tex` | 附录 |
| `backmatter/acknowledgements.tex` | 致谢 |
| `backmatter/achievements.tex` | 科研成果 |
| `backmatter/projects.tex` | 科研项目 |
| `backmatter/defense.tex` | 评阅与答辩信息 |
| `backmatter/foreign-paper.tex` | 可选外文论文 |

无需编辑 `sdu-thesis.cls` 即可完成一般论文。不要把原论文的个人信息和正文放入公开仓库。

## 正式交稿前移除规范

`main.tex` 中有一条单独的规范插入命令，默认开启：

```tex
\input{chapters/guide}
```

正式交稿时只需在它前面加 `%`：

```tex
% \input{chapters/guide}
```

无需修改计数器或手填页码。规范标题及条目从中英文目录消失，后续章号自动前移。需要时去掉 `%` 即可恢复。第一章的说明也需要改写为实际绪论；不应把说明和规范作为研究正文提交。

规范为所依据的 2022 文件全文转排（含通知、六部分正文及文献示例），不是摘要或截图；保留历史文件原文，未擅自更新其标准年份或印数。

## 常用写法

中英文目录共享一组标题与页码。每个标题同时填写两个语言版本：

```tex
\bichapter{绪论}{Introduction}
\bisection{研究背景}{Research Background}
\bisubsection{问题的提出}{Problem Statement}
```

不要只用 `\chapter` 或 `\section`，否则英文目录不会自动得到译文。模板不自动翻译标题。中文目录显示到三级，英文目录保持相同层级。改标题后重新编译即可同步页码和链接。

图片替换示例（把 `my-result.png` 放到 `figures`）：

```tex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=.7\textwidth]{figures/my-result.png}
  \SDUfigurecaption{中文图题}{English figure caption}
  \label{fig:result}
\end{figure}
正文见图\ref{fig:result}。
```

表格标题用 `\SDUtablecaption{中文表题}{English table caption}`，放在表格上方。完整三线表和自动续表示例在 `chapters/ch03.tex`（启用规范时为第四章，关闭后为第三章）；第一章含两幅图，其中第二幅包含小猫、小狗两个分图。小动物由 TikZ 绘制，无外部图片下载和授权依赖。

公式用 `equation` 和 `\label`，通过 `\eqref` 引用。文献在 `references.bib` 添加条目，正文写 `\cite{文献键}`；编号按正文引用顺序生成，采用 GB/T 7714—2015 顺序编码制。示例文献为虚构占位，不能直接提交。

特殊字符：百分号写 `\%`，下划线写 `\_`，井号写 `\#`，与号写 `\&`。网址使用 `\url{https://example.com}`。公式放在 `$...$` 或公式环境内。

## 页面及字体选择

- 默认双面、各章从奇数页开始，因此会有**有意保留的空白偶数页**，空白页无页眉页码。删除空白页会影响双面装订顺序。
- 封面和扉页默认均保留，内容相同，符合随附指南的表述。已经使用统一印制封面时，可在 `metadata.tex` 把 `\SDUprintcovertrue` 改成 `\SDUprintcoverfalse`。不另需扉页时改 `\SDUtitlepagefalse`。
- 按《规范》，奇数、偶数的非空编号页均使用“山东大学博士学位论文”或“山东大学硕士学位论文”，随层次自动切换。原样稿偶数页章节页眉已取消；旧 `guideheader` 参数仅保留兼容性。
- Windows 自动使用宋体、黑体、楷体和 Times New Roman。其他环境自动回退至 Fandol 和 TeX Gyre Termes；字体不同会影响换行和分页。要固定便携字体，用 `\documentclass[portable]{sdu-thesis}`；无需另选页眉模式。
- 图表目录为新增便利功能，默认开启。关闭时改 `\SDUlistsfalse`。外文论文默认关闭，开启用 `\SDUforeignpapertrue`。
- 声明页的规范文字已保留，签名和日期留空，打印后按要求填写。评阅及答辩表是新增可编辑示例；如果学院提供指定表格，请用指定表格替换。
- 封面较长的中英文题目会自动换行。超长的院系名或导师信息需要检查封面下划线宽度，不宜直接缩小全部字体。

## 分享与维护

本项目代码和原创占位图使用 MIT 许可；引用的 GB/T 7714 宏包保留原许可证及原始源码，见 [THIRD-PARTY.md](THIRD-PARTY.md)。校名校徽图像不属于 MIT 授权范围。模板不是山东大学官方发布或认证版本，也未核定 2022 指南之后的校方修订；提交时以本专业、学院当期要求为准。

本地已打包完整 `example.pdf`，可先核对版式再填写；重新编译输出为 `main.pdf`。GitHub 自动编译配置已提供，但没有在远程仓库运行。公开发布时上传整个源码目录；不要上传 `tmp` 下的原稿提取材料。也可以使用不带校名校徽图像的源码包，封面会自动显示纯文字校名；该包不附含校徽的预览。

参考了 [ThuThesis](https://github.com/tuna/thuthesis) 和 [pkuthss](https://github.com/CasperVector/pkuthss) 的项目组织方式；本类基于 ctexbook 独立编写，未复制它们的类文件。
