
<!-- Vamos adicionar o logotipo do sistema -->

<p align="center">
<img align="center" src="https://github.com/hexagonix/Doc/blob/main/Img/banner.png">
</p>

<div align="center">

![](https://img.shields.io/github/license/hexagonix/hexagonix.svg)
![](https://img.shields.io/github/stars/hexagonix/hexagonix.svg)
![](https://img.shields.io/github/issues/hexagonix/hexagonix.svg)
![](https://img.shields.io/github/issues-closed/hexagonix/hexagonix.svg)
![](https://img.shields.io/github/issues-pr/hexagonix/hexagonix.svg)
![](https://img.shields.io/github/issues-pr-closed/hexagonix/hexagonix.svg)
![](https://img.shields.io/github/downloads/hexagonix/hexagonix/total.svg)
![](https://img.shields.io/github/release/hexagonix/hexagonix.svg)
[![](https://img.shields.io/twitter/follow/hexagonixOS.svg?style=social&label=Follow%20%40HexagonixOS)](https://twitter.com/hexagonixOS)

</div>

<!-- Vai funcionar como <hr> -->

## :uk: Instructions for cloning this repository

<div align="justify">

This repository groups in a single structure all component repositories needed to build Hexagonix locally. You can clone each one of them individually, but when using this repository, all the files will be in the place expected by the tools to build and run in a virtualized environment.

To locally clone this repository, use, in your repository of interest:

```
git clone https://github.com/hexagonix/src Hexagonix/
hexagonix cd
git submodule init
git submodule update
cd scripts
cp hx configure.sh ../
cd ..
chmod +x hx configure.sh
```

Afterwards, use the `hx` tool to build and run the system. For more information on using hx, use:

```
./hx -h
```

To keep the repository up to date with the latest updates, use:

```
git submodule update --remote
```

</div>

## :brazil: Instruções para clonar este repositório

<div align="justify">

Este repositório agrupa em uma única estrutura todos repositórios de componentes necessários para a construção do Hexagonix localmente. Você pode clonar cada um deles individualmente, mas ao utilizar este repositório, todos os arquivos estarão no lugar esperado pelas ferramentas de construção e execução em ambiente virtualizado.

Para clonar localmente este repositório, use, em seu repositório de interesse:

```
git clone https://github.com/hexagonix/src Hexagonix/
cd Hexagonix
git submodule init
git submodule update
cd Scripts
cp hx configure.sh ../
cd ..
chmod +x hx configure.sh
```

Após, utilize a ferramenta `hx` para construir e executar o sistema. Para mais informações sobre o uso do hx, utilize:

```
./hx -h
```

Para manter o repositório atualizado com as atualizações mais recentes, use:

```
git submodule update --remote
```

</div>