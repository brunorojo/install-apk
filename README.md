# Instalação do APK em dispositivos Android Físicos ou Emuladores.
Este script instalar o APK em dispositivos Android, ao executa-lo ele procura o arquivo com extensão .APK, 
que deve estar na mesma pasta do script, e faz a instalação do APK no dispositivo que deve estar conectado 
físicamente no computador.

# Informações importantes:
> - Comando "ADB" deve estar configurado no computador. 
> - O nome do arquivo APK não pode conter espaço.(bugzinho do código @FIXME)
> - Não pode conter mais de um arquivo apk na pasta, senão ele instala o primeiro que encontrar.



## Como usar?  
PASSO 1 - Cole o arquivo .apk na pasta do script install-apk-lexis.v1.2.sh  
PASSO 2 - Utilizando o git-bash para Windows ou via terminal no MAC, execute o comando:
```bash
./install-apk-lexis.v1.2.sh
```


> by: Bruno Rojo