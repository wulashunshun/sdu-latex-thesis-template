# 第三方材料

## GB/T 7714 参考文献格式

- 项目：https://github.com/zepinglee/gbt7714-bibtex-style
- 作者：Zeping Lee
- 固定版本：v2.1.5，2022-10-03；与随附 2022 指南采用的 2015 版规则对应。
- 文件：根目录 `gbt7714.sty`、`gbt7714-numerical.bst`，未经修改。
- 原始源码：`vendor/gbt7714.dtx` 和 `vendor/gbt7714.ins`。
- 许可：LPPL 1.3c 或更新版本，全文见 `vendor/gbt7714-LICENSE`。
- 获取路径：https://raw.githubusercontent.com/CTeX-org/gbt7714-bibtex-style/v2.1.5/

## 学校标识和声明

`figures/sdu-mark-doctor.jpg` 和 `figures/sdu-mark-master.jpg` 直接提取自用户提供的学校《2024版学位论文封面（扉页）.docx》，分别对应博士黑色校标和硕士红色校标。没有重绘、改色或嵌入个人论文 PDF 的隐藏对象。它们属于学校标识，不在本项目 MIT 授权范围内。不带图像时自动排出纯文字校名；不带校徽的源码包同时排除两种图像。

声明页保留参考论文中固定声明文字，其性质不是本项目原创软件代码。封面其余内容用可编辑 LaTeX 排版。

## 规范全文

`chapters/guide.tex` 按用户要求转排其提供的《山东大学研究生学位论文撰写指南》（山大研字〔2022〕1号，2022年1月5日）及发布通知。校方规范原文、发布通知和其中引文示例不属于本项目原创代码，不由 MIT 许可证重新授权。仅 LaTeX 排版实现属于本项目代码。

## 基础依赖和字体

ctex、XeLaTeX、TikZ 等由用户 TeX 发行版提供，未随项目复制。Windows 字体不随项目分发；便携模式调用发行版已有 Fandol、TeX Gyre 字体。

## 参考项目

浏览了 ThuThesis 和 pkuthss 的仓库及说明，仅参考组织方式，没有派生其模板源码。相应仓库链接见 README。
