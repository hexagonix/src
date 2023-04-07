
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

<img src="https://github.com/hexagonix/Doc/blob/main/Img/hr.png" width="100%" height="2px" />

<div align="center">

# Select the language - Selecione o idioma

</div>

<table align="center">
<tr>
<td><a href="https://github.com/hexagonix/src#uk-instructions-for-cloning-this-repository">:uk: English</a></td>
<td><a href="https://github.com/hexagonix/src#brazil-instru%C3%A7%C3%B5es-para-clonar-este-reposit%C3%B3rio">:brazil: Português</a></td>
</tr>
</table>

<!-- Vai funcionar como <hr> -->

<img src="https://github.com/hexagonix/Doc/blob/main/Img/hr.png" width="100%" height="2px" />

# :uk: Instructions for cloning this repository

<table align="center">
<tr>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/Hexagonix.en.md">About Hexagonix</a></td>
<td><a href="https://github.com/hexagonix/Doc">Documentation</a></td>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/Hexagonix.en.md#-screenshots">Screenshots</a></td>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/Hexagonix.en.md#contribute-and-report-bugs">Contribute</a></td>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/README.pt.md">Download</a></td>
</tr>
</table>

<div align="justify">

This repository groups in a single structure all component repositories needed to build Hexagonix locally. You can clone each one of them individually, but when using this repository, all the files will be in the place expected by the tools to build and run in a virtualized environment.

To locally clone this repository, use, in your repository of interest:

```
git clone https://github.com/hexagonix/src Hexagonix/
cd Hexagonix
chmod +x sync.sh
./sync.sh
```

> It is worth remembering that you can perform this step more quickly using the script present in the [build](https://github.com/hexagonix/build) repository. You can use this script using, in the terminal:

```
git clone https://github.com/hexagonix/build
cd build
chmod +x hexagonix.sh
./hexagonix.sh
```

After cloning (directly or using the `hexagonix.sh` script), use the `hx` tool to build and run the system. For more information on using hx, use:

```
./hx -h
```

To build Hexagonix, use:

```
sudo ./configure.sh
sudo hx -i
```

To run Hexagonix in a virtualized environment, use:

```
hx -v
```

To keep the repository up to date with the latest updates, use:

```
git pull
git submodule update --remote
```

</div>

<!-- Vai funcionar como <hr> -->

<img src="https://github.com/hexagonix/Doc/blob/main/Img/hr.png" width="100%" height="2px" />

# :brazil: Instruções para clonar este repositório

<table align="center">
<tr>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/Hexagonix.pt.md">Sobre o Hexagonix</a></td>
<td><a href="https://github.com/hexagonix/Doc">Documentação</a></td>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/Hexagonix.pt.md#-capturas-de-tela">Screenshots</a></td>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/Hexagonix.pt.md#contribuir-e-reportar-erros">Contribuir</a></td>
<td><a href="https://github.com/hexagonix/Doc/blob/main/Hexagonix/README.pt.md">Download</a></td>
</tr>
</table>

<div align="justify">

Este repositório agrupa em uma única estrutura todos repositórios de componentes necessários para a construção do Hexagonix localmente. Você pode clonar cada um deles individualmente, mas ao utilizar este repositório, todos os arquivos estarão no lugar esperado pelas ferramentas de construção e execução em ambiente virtualizado.

Para clonar localmente este repositório, use, em seu repositório de interesse:

```
git clone https://github.com/hexagonix/src Hexagonix/
cd Hexagonix
chmod +x sync.sh
./sync.sh
```

> Vale lembrar que você pode realizar essa etapa de forma mais rápida utilizando o script presente no repositório [build](https://github.com/hexagonix/build). Você pode utilizar esse script utilizando, no terminal:

```
git clone https://github.com/hexagonix/build
cd build
chmod +x hexagonix.sh
./hexagonix.sh
```

Após a clonagem (de forma direta ou utilizando o script `hexagonix.sh`), utilize a ferramenta `hx` para construir e executar o sistema. Para mais informações sobre o uso do hx, utilize:

```
./hx -h
```

Para construir o Hexagonix, use:

```
sudo ./configure.sh
sudo hx -i
```

Para executar o Hexagonix em ambiente virtualizado, use:

```
hx -v
```

Para manter o repositório atualizado com as atualizações mais recentes, use:

```
./sync.sh
```

</div>