## English

Anyone can contribute to Hexagonix, and contributions are welcome and encouraged. As an open source project, the community has the power to improve Hexagonix, in addition to using the code already developed as a basis for other projects, as long as the [software license](LICENSE) is respected.

### Contributor License Agreement

`Contributors should be aware that any contribution must comply with the [license](LICENSE) and will be released under the license that governs Hexagonix`. For more information, read the license, available in this repository.

### Contributing code

You can submit code for any Hexagonix component, using the supported development languages ​​for each component.

> For code in x86 assembly:

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

.day: dd 5 ;; Declaring a numerical variable (gapp.dia) in the same line.
```

In the header of the file, it must contain the author's name, with copyright, as below:

```
Copyright (c) 2023 Author
All rights reserved.
```

<hr>

## Português (Brasil)

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
Copyright (c) 2023 Autor
Todos os direitos reservados.
```
