# Códigos em ASM
## Descrição
<p>

  Este repositório possui códigos em Assembly, mais especificamente na linguagem de montagem NASM, utilizando a extensão .asm. Abaixo pode ser visto como executar os códigos propostos, bem como o uso desses códigos, dependendo das características individuais de cada um. Há também instruções sobre o uso dos códigos escritos na plataforma SASM, utilizada em abundância por conta da facilidade de teste e execução. Os arquivos estão separados por tipo e assunto em seus respectivos diretórios. Nem todos eles possuem comentários descritivos, portanto os nomes de alguns arquivos podem ser mais longos que outros, indicando de forma sintática o propósito do código.

</p>

## Montagem e Execução
### Visão geral
<p>
  
  Primeiramente, devemos entender que o Assembly é uma linguagem de montagem e não é executada diretamente pelo processador. Para executar o código em assembly, devemos converter o arquivo .asm em um objeto .o. Em seguida, verifica-se se há a chamada de procedimentos existentes em alguma biblioteca, linkando esses procedimentos com o arquivo objeto caso afirmativo e gerando o executável, que virá a ser executado posteriormente.
  
Em geral, o ponto de início do programa é o "main".
   
</p>

### Montagem
<p>No GCC, o NASM pode ser montado utilizando o comando:</p>

```
nasm -f elf [nome-do-arquivo].asm
```

### Linkagem
<p>No GCC, o processo de ligação pode ser feito com o comando:</p>

```
gcc -m32 -o [nome-do-executável] [nome-do-arquivo-objeto].o
```

### Execução
<p>A execução do programa segue o padrão com o comando:</p>

```
./[nome-do-executável]
```

## Uso do SASM
<p>
  
  O SASM é um ambiente de desenvolvimento de código aberto (uma IDE) para as linguagens de montagem NASM, MASM, GAS e FASM. A utilização dessa plataforma facilita a escrita dos códigos por mostrar o estado dos registradores, das flags ativadas em cada operação e das variáveis declaradas no momento da execução com o uso de uma funcionalidade que permite executar o código linha por linha, evitando o trabalho de montar e ligar os arquivos para ver a exeução e proporcionando um entendimento melhor dos comandos. Dessa maneira, temos um aproveitamento maior do estudo. É aconselhável que os códigos em assembly sejam executados no SASM com o intuito de entender o funcionamento e uso dos registradores, especialmente no estudo da FPU - Unidade de Ponto Flutuante, no entanto isso não exclui a importância de saber como montar e ligar o código por linha de comando.
   
</p>

## Printf & Scanf
<p>
  
  É possível utilizar as funções printf e scanf das bibliotecas da linguagem c dentro do código NASM, especificando sua importação antes do código com as linhas:

```asm
extern scanf
extern printf
```
  Para utilizar os códigos e executá-los no terminal é necessário utilizar as funções Printf e Scanf. Porém, de forma didática, é possível utilizar uma biblioteca do SASM, chamada com a linha:

```asm
%include "io.inc"
``` 
  Essa biblioteca utiliza as seguintes linhas de código para receber e imprimir elementos:
  
```asm
GET_UDEC   [tamanho em bytes], eax
PRINT_UDEC [tamanho em bytes], eax
``` 
  Dessa maneira, é possível simplificar o uso de PRINTF e SCANF. No entando, é necessário compreender que utilizar essas funções é a maneira mais correta de realizar esses procedimentos. No link <a href="https://github.com/oliveiraD4vi/asm-codes/blob/master/Printf%20%26%20Scanf/exemplo_printf.asm">exemplo-printf.asm</a> há um exemplo de uso do PRINTF no diretório em questão.
  
</p>

###### end
