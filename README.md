# Códigos em ASM
## Descrição
<p>

  Este repositório possui códigos em Assembly, utilizando a extensão ASM. Abaixo pode ser visto como executar os códigos propostos, bem como o uso desses códigos, dependendo das características individuais de cada um. Há também instruções sobre o uso dos códigos escritos na plataforma SASM, utilizada em abundância por conta da facilidade de teste e execução. Os arquivos estão separados por tipo e assunto em seus respectivos diretórios. Nem todos eles possuem comentários descritivos, portanto os nomes de alguns arquivos podem ser mais longos que outros, indicando de forma sintática o propósito do código.

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
nasm -f elf main.asm
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

## Printf & Scanf

###### end
