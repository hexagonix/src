
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

## :uk: English

</div>

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

Anyone can contribute to Hexagonix, and contributions are welcome and encouraged. As an open source project, the community has the power to improve Hexagonix, in addition to using the code already developed as a basis for other projects, as long as the [software license](LICENSE) is respected.

### Contributor License Agreement

`Contributors should be aware that any contribution must comply with the [license](LICENSE) and will be released under the license that governs Hexagonix`. For more information, read the license, available in this repository.

### Contributing code

You can submit code for any Hexagonix component, using the supported development languages ​​for each component.

> For code in x86 Assembly:

Code submitted in x86 Assembly must follow formatting standards to facilitate organization, readability and uniformity with the current code base of the system. Here is a commented code example:

```assembly
VERSION equ "1.1" ;; Constant values ​​must be declared on the same line.

gapp: ;; name of a symbol

.hellomessage: ;; A variable with content, which belongs to `gapp`.
db 10, 10, "This is a sample Hexagonix(R) graphical HAPP application!", 10, 10
db 10, 10, "Press any key to end this program...", 10, 10, 0

;; As seen above, the contents in character form (string) must always be
;; be started below the name, facilitating readability and organization
;; in codes with many variables.

.vd0: ;; Another example of content with a string.
db "vd0", 0 ;; Contents of gapp.vd0

;; Numeric variables and constants must be declared on the same line, as below:

.day: dd 5 ;; Declaring a numerical variable (gapp.dya) in the same line.
```

In the header of the file, it must contain the author's name, with copyright, as below:

```
Copyright (c) 2024 Author
All rights reserved.
```

Also, add the name and email in the [authors](AUTHORS) file.

</div>

<!-- Vai funcionar como <hr> -->

<img src="https://github.com/hexagonix/Doc/blob/main/Img/hr.png" width="100%" height="2px" />

<div align="center">

## :brazil: Português (Brasil)

</div>

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

Qualquer pessoa pode contribuir com o Hexagonix, e essas contribuições são desejadas e incentivadas. Como projeto de código aberto, a comunidade tem o poder de melhorar o Hexagonix, além de utilizar o código já desenvolvido como base de outros projetos, desde que respeitada a [licença de software](LICENSE).

### Contrato de licença do colaborador

`Os colaboradores devem estar cientes que qualquer contribuição deve respeitar a [licença](LICENSE) e serão liberadas sob a licença que governa o Hexagonix`. Para mais informações, leia a licença, disponível neste repositório. 

### Contribuindo com código

Você pode submeter código para qualquer componente do Hexagonix, utilizando as linguagens suportadas para o desenvolvimento de cada um deles. 

> Para código em Assembly x86:

O código submetido em Assembly x86 deve seguir normas de formatação para facilitar a organização, legibilidade e uniformidade com a base de código atual do sistema. Para isso, aqui vai um exemplo de código comentado:

```assembly
VERSAO equ "1.1" ;; Os valores de constantes devem ser declarados na mesma linha.

gapp: ;; Nome de um símbolo

.mensagemOla: ;; Uma variável com conteúdo, que pertence a `gapp`.
db 10, 10, "Este e um exemplo de aplicativo HAPP grafico do Hexagonix(R)!", 10, 10
db 10, 10, "Pressione qualquer tecla para finalizar este programa...", 10, 10, 0 

;; Como visto acima, os conteúdos em forma de caractere (string) devem sempre
;; ser iniciados abaixo do nome, facilitando a legibilidade e organização
;; em códigos com muitas variáveis.

.vd0: ;; Outro exemplo de conteúdo com uma string.
db "vd0", 0 ;; Conteúdo de gapp.vd0

;; Variáveis e contantes numéricas devem ser declaradas na mesma linha, como abaixo:

.dia: dd 5 ;; Declarando uma variável numérica (gapp.dia) em uma mesma linha.
```

No cabeçalho do arquivo, deve conter o nome do autor, com copyright, como abaixo:

```
Copyright (c) 2024 Autor
Todos os direitos reservados.
```

Além disso, adicione o nome e email no arquivo de [autores](AUTHORS).

</div>