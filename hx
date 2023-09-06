#!/bin/bash
#
#*************************************************************************************************
#
# 88                                                                                88
# 88                                                                                ""
# 88
# 88,dPPPba,   ,adPPPba, 8b,     ,d8 ,adPPPPba,  ,adPPPb,d8  ,adPPPba,  8b,dPPPba,  88 8b,     ,d8
# 88P'    "88 a8P     88  `P8, ,8P'  ""     `P8 a8"    `P88 a8"     "8a 88P'   `"88 88  `P8, ,8P'
# 88       88 8PP"""""""    )888(    ,adPPPPP88 8b       88 8b       d8 88       88 88    )888(
# 88       88 "8b,   ,aa  ,d8" "8b,  88,    ,88 "8a,   ,d88 "8a,   ,a8" 88       88 88  ,d8" "8b,
# 88       88  `"Pbbd8"' 8P'     `P8 `"8bbdP"P8  `"PbbdP"P8  `"PbbdP"'  88       88 88 8P'     `P8
#                                               aa,    ,88
#                                                "P8bbdP"
#
#                    Sistema Operacional Hexagonix - Hexagonix Operating System
#
#                         Copyright (c) 2015-2023 Felipe Miguel Nery Lunkes
#                        Todos os direitos reservados - All rights reserved.
#
#*************************************************************************************************
#
# Português:
#
# O Hexagonix e seus componentes são licenciados sob licença BSD-3-Clause. Leia abaixo
# a licença que governa este arquivo e verifique a licença de cada repositório para
# obter mais informações sobre seus direitos e obrigações ao utilizar e reutilizar
# o código deste ou de outros arquivos.
#
# English:
#
# Hexagonix and its components are licensed under a BSD-3-Clause license. Read below
# the license that governs this file and check each repository's license for
# obtain more information about your rights and obligations when using and reusing
# the code of this or other files.
#
#*************************************************************************************************
#
# BSD 3-Clause License
#
# Copyright (c) 2015-2023, Felipe Miguel Nery Lunkes
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $HexagonixOS$

# $PORTUGUÊS$
#
# Esse script deve ficar na raiz do projeto
#
# Esse script foi desenvolvido para rodar sobre o Linux e versão do QEMU para Linux.
# A versão atual é totalmente compatível com o ambiente WSL 2 (e apenas a versão 2).
# Aviso! Até o momento, o script não é compatível com a geração do sistema sobre o
# FreeBSD. Entretanto, já é compatível para a execução de máquinas virtuais. O suporte
# total ao FreeBSD está a caminho.
#
#
# $ENGLISH$
#
# This script must be in the root of the project
#
# This script was developed to run on Linux and the Linux version of QEMU.
# The current version is fully compatible with the WSL 2 environment (and version 2 only).
# Warning! At this time, the script does not support system generation over FreeBSD.
# However, it is already supported for running virtual machines. The full support to
# FreeBSD is on the way.

# Sessão de ajuda e informações sobre o hx

exibirAjuda() {

echo
echo -e "hx $VERSAOHX help:"
echo
echo -e "\e[1;94mMain\e[0m available parameters:"
echo
echo -e "\e[1;32m-v\e[0m - Start a virtual machine. The available parameters are\e[1;31m (default hx)*\e[0m:"
echo -e "\e[1;32m hx\e[0m        - Start Hexagonix virtual machine"
echo -e "\e[1;32m hx.snd\e[0m    - Start Hexagonix virtual machine in sound mode"
echo -e "\e[1;32m hx.serial\e[0m - Start Hexagonix virtual machine with no serial output"
echo -e "\e[1;32m hx.bsd\e[0m    - Start BSD host compatible virtual machine"
echo -e "\e[1;31m * The 'hx' option will be selected if no parameter is passed after '-v'!\e[0m"
echo -e "\e[1;32m-i\e[0m - Build disk image. Available parameters are\e[1;31m (default hx)*\e[0m:"
echo -e "\e[1;32m hx\e[0m      - Build disk image with Hexagonix"
echo -e "\e[1;32m hx.test\e[0m - Build test disk image with Hexagonix"
echo -e "\e[1;31m * The 'hx' option will be selected if no parameter is passed after '-i'!\e[0m"
echo -e "\e[1;32m-u\e[0m  - Update all repositories with server (current branch)"
echo -e "\e[1;32m-ui\e[0m - Sync Hexagonix images with the official repository"
echo -e "\e[1;32m-br\e[0m - Get information about current used branch"
echo -e "\e[1;32m-un <branch>\e[0m - Switch branch to <branch> and update all repositories"
echo -e "\e[1;32m-m\e[0m - Clone repositories to location and configure build environment"
echo -e "\e[1;32m-c\e[0m - Clear system tree binary and configuration files"
echo
echo  "See the complete documentation at: https://github.com/hexagonix/Doc"
echo

}

exibirCopyright() {

clear

export MSG="Copyright"

banner

echo -e "\e[1;94mHX: Hexagonix build and test tool version $VERSAOHX\e[0m"
echo
echo -e "Developed by \e[1;32mFelipe Miguel Nery Lunkes\e[0m"
echo
echo -e "\e[0mCopyright © 2015-2023 Felipe Miguel Nery Lunkes\e[0m"
echo -e "\e[0mAll rights reserved.\e[0m"
echo

}

parametrosNecessarios(){

echo
echo -e "You must provide at least one \e[1;94mvalid\e[0m parameter to HX."
echo
echo -e "\e[1;94mTip: use \e[1;32m./hx -h \e[1;94mor \e[1;32m$NOMEHX -h\e[1;94m to get the available parameters.\e[0m"
echo

}

#-------------------------------- Divisão --------------------------------#

# Sessão de construção coletiva dos componentes do sistema

gerenciarConstrucao()
{

obterInfoBuild

case $PT2 in

hx) prepImagemHexagonix; exit;;
hx.teste) prepImagemHexagonixTeste; exit;;
bsd) prepImagemHexagonixBSD; exit;;
UNIX) prepImagemHexagonixUNIXSolaris; exit;;
*) prepImagemHexagonix; exit;; # Assumir hx -i hx

esac

}

gerenciarConstrucaoComponentes()
{

mkdir -p $DESTINODISTRO
mkdir -p $DESTINODISTRO/bin
mkdir -p $DESTINODISTRO/etc

case $PT2 in

hexagon) construirHexagon; exit;;
HBoot) construirHBoot; exit;;
saturno) construirSaturno; exit;;
unixland) construirUtilUnix; exit;;
andromedaland) construirBaseAndromeda; exit;;
hexagonix) hexagonix; exit;;
hx) construirTudo; exit;;
*) parametrosNecessarios; exit;;

esac

}

#-------------------------------- Divisão --------------------------------#

# Sessão de configuração para montagem do sistema

prepImagemHexagonix(){

export HOST="LINUX"

verificarEstaticos

iniciarLog

definirHexagonixOficial

imagemHexagonix

}

prepImagemHexagonixBSD(){

export HOST="BSD"

verificarEstaticos

iniciarLog

definirHexagonixOficial

imagemHexagonix

}

prepImagemHexagonixUNIXSolaris()
{

export HOST="UNIX"

verificarEstaticos

iniciarLog

definirHexagonixOficial

imagemHexagonix

}

prepImagemHexagonixTeste(){

export HOST="LINUX"

verificarEstaticos

iniciarLog

definirHexagonixTeste

imagemHexagonix

}

#-------------------------------- Divisão --------------------------------#

definirHexagonixTeste()
{

# Aqui vamos gerar uma imagem pequena, de 2 Mb, menor e apenas para testes. Essa imagem
# não deve ser utilizada para o pacote de instalação.

export TAMANHOIMAGEM=2097012
export TAMANHOTEMP=2048

}

definirHexagonixOficial()
{

# Aqui vamos definir uma imagem de tamanho oficial, que demora mais a ser gerada. Essa imagem é
# apropriada para o pacote de instalação do Hexagonix

export TAMANHOIMAGEM=47185920
export TAMANHOTEMP=92160

}

definirVerbose()
{

# Aqui vamos definir se mensagens de erro deverão aparecer no processo de montagem

case $PT2 in

hexagonix) definirHexagonix; exit;;
*) definirHexagonix; exit;;

esac

}

#-------------------------------- Divisão --------------------------------#

# Sessão de construtores individuais dos componentes do sistema

# Vamos separar aqui as etapas comuns de construção do sistema para reutilizar
# código e facilitar a busca de erros

construirHexagon(){

cd Hexagon

echo
echo -en "\e[1;94mBuilding the Hexagon kernel...\e[0m"

echo "Building the Hexagon kernel... {" >> ../log.log
echo >> ../log.log

fasm kern/Hexagon.asm Hexagon -d $FLAGS_HEXAGON >> ../log.log || erroConstrucao

cp Hexagon ../$DESTINODISTRO/bin

rm -r Hexagon

echo -e " [\e[32mOk\e[0m]"

echo >> ../log.log
echo "} Hexagon kernel built successfully." >> ../log.log
echo >> ../log.log
echo "----------------------------------------------------------------------" >> ../log.log
echo >> ../log.log

cd ..

}

construirSaturno(){

echo -e "\e[1;94mBuilding Hexagon startup components...\e[0m {"
echo

echo "Building Hexagon startup components... {" >> $LOG
echo >> $LOG

echo -e "\e[1;94m > Hexagon bootloader - Saturno (1st stage)...\e[0m"
echo

echo " > Hexagon bootloader - Saturno (1st stage)..." >> $LOG
echo >> $LOG

cd Boot

cd Saturno

fasm saturno.asm ../saturno.img >> ../../log.log || erroConstrucao

echo >> ../../log.log

fasm mbr.asm ../mbr.img >> ../../log.log || erroConstrucao

echo >> ../../log.log

cd ..

}

construirHBoot(){

echo -e "\e[1;94mBuilding Hexagon Boot - HBoot (2nd stage)...\e[0m"
echo

echo " > Building Hexagon Boot - HBoot (2nd stage)..." >> ../log.log
echo >> ../log.log

cd "Hexagon Boot"

fasm hboot.asm ../hboot -d $FLAGS_HBOOT >> ../../log.log || erroConstrucao

cd Mods

if [ -e Spartan.asm ] ; then

for i in *.asm
do

    echo -en "Building HBoot compatible module \e[1;94m$(basename $i .asm).mod\e[0m..."

    echo >> ../../../log.log
    echo " > Building HBoot compatible module $(basename $i .asm).mod..." >> ../../../log.log

    fasm $i ../../`basename $i .asm`.mod -d $FLAGS_COMUM >> ../../../log.log

    echo -e " [\e[32mOk\e[0m]"

done

fi

cd ..

cd ..

cp *.img ../$DESTINODISTRO
cp hboot ../$DESTINODISTRO

if [ -e Spartan.mod ] ; then

cp *.mod ../$DESTINODISTRO/
rm -r *.mod

fi

rm -r *.img
rm -r hboot

echo
echo -e "} [\e[32mStartup components built successfully\e[0m]."

echo >> ../log.log
echo "} Successfully built Hexagon startup components." >> ../log.log
echo >> ../log.log
echo "----------------------------------------------------------------------" >> ../log.log
echo >> ../log.log

cd ..

}

construirUtilUnix(){

# Gerar os aplicativos base Unix

cd Apps/Unix

./Unix.sh $DESTINODISTRO

cd ..

}

construirBaseAndromeda(){

# Gerar os aplicativos Hexagonix-Andromeda

cd Andromeda

./Apps.sh $DESTINODISTRO

cd ..

cd ..

}

erroMontagem()
{

if test $VERBOSE -e 0; then

clear

elif test $VERBOSE -e 1; then

echo

fi

export MSG="System build error"

banner
echo
echo -e "\e[1;31mSomething went wrong while mounting the image:(\e[0m"
echo
echo "Use the system generation script to verify the source of the problem."
echo

umount $PWD/Sistema >> /dev/null
umount $DESTINODISTRO/ >> /dev/null

exit

}

#-------------------------------- Divisão --------------------------------#

construirTudo()
{

export MSG="Building the Hexagonix"

clear

banner

construirSaturno
construirHBoot
construirHexagon
construirUtilUnix
construirBaseAndromeda

terminar
tudopronto

}

construtorHexagonix()
{

export MSG="Building the Hexagonix"

clear

banner

echo "Building the Hexagonix..."
echo

mkdir -p $DESTINODISTRO
mkdir -p $DESTINODISTRO/bin
mkdir -p $DESTINODISTRO/etc

construirSaturno
construirHBoot
construirHexagon
construirUtilUnix
construirBaseAndromeda

echo "Configuring and copying Hexagonix static files... {" >> $LOG
echo >> $LOG

cd Dist

echo "> Copying static configuration files (generated by configure.sh)..." >> ../$LOG

cd etc/

cp rc passwd ../../$DESTINODISTRO/etc

echo " > passwd successfully copied." >> ../../$LOG

cp *.unx ../../$DESTINODISTRO/etc

echo " > *.unx files successfully copied." >> ../../$LOG

cp base.ocl ../../$DESTINODISTRO/hexgnix.ocl
cp shrc ../../$DESTINODISTRO/etc

echo " > Hexagonix version files successfully copied." >> ../../$LOG

cd ..

echo "> Copying Hexagonix utility manuals..." >> ../$LOG

cd man

cp *.man ../../$DESTINODISTRO

cd ..
cd ..

cd Fontes/

echo "> Checking for additional fonts to build..." >> ../$LOG

if [ -e aurora.asm ] ; then

echo -e "There are graphic fonts to be built and copied... [\e[32mOk\e[0m]"
echo " > There are graphic fonts to be built and copied..." >> ../$LOG

./fontes.sh

cp *.fnt ../$DESTINODISTRO
rm *.fnt

echo
echo -n "Fonts copied"
echo -e " [\e[32mOk\e[0m]"
echo " > Fonts copied." >> ../$LOG
echo

else

echo " > There are no graphic fonts to be built and copied..." >> ../$LOG
echo -e "There are no graphic fonts to build and copy... [\e[32mOk\e[0m]"
echo

fi

# Vamos copiar também o arquivo de cabeçalho para poder desenvolver sobre o Hexagonix(R)

cd ..

echo "> Copying core development libraries..." >> $LOG
echo "Copying core development libraries..."
echo

cd lib/fasm

cp hexagon.s ../../$DESTINODISTRO
cp console.s ../../$DESTINODISTRO
cp macros.s ../../$DESTINODISTRO

cd Estelar

cp estelar.s ../../../$DESTINODISTRO

cd ..
cd ..

cd exemplo

cp * ../../$DESTINODISTRO/

cd ..
cd ..

echo -n "Libraries copied"
echo -e " [\e[32mOk\e[0m]"
echo

echo >> $LOG
echo "} Success configuring and copying Hexagonix configuration files." >> $LOG
echo >> $LOG
echo "----------------------------------------------------------------------" >> $LOG
echo >> $LOG

echo "Building additional (contrib) packages... {" >> $LOG
echo >> $LOG

if [ -e Contrib/Contrib.sh ] ; then

echo "> There are additional packages to build." >> $LOG
echo >> $LOG

cd Contrib

./Contrib.sh $DESTINODISTRO

cd ..

else

echo "> There are no additional packages to build." >> $LOG
echo "There are no additional packages to build."
echo

fi

echo >> $LOG
echo "} Success processing additional (contrib) packages." >> $LOG
echo
echo "> View the 'log.log' log file for more information of the build."
echo

}

erroConstrucao(){

echo "An error occurred while building some system component."
echo
echo "Check the status of the components and use the above error outputs to verify the problem."
echo
echo "View the log file 'log.log', for more information about the error(s)."
echo

umount Sistema/ >> /dev/null
umount $DESTINODISTRO/ >> /dev/null

exit

}

#-------------------------------- Divisão --------------------------------#

# Sessão de criação de imagem do sistema

imagemHexagonix()
{

if test "`whoami`" != "root" ; then

sureq

exit

fi

# Agora os arquivos do sistema serão gerados...

construtorHexagonix $Par

# Agora a imagem do sistema será preparada...

echo -e "\e[1;94mBuilding system image...\e[0m"
echo

echo >> $LOG
echo "----------------------------------------------------------------------" >> $LOG
echo >> $LOG
echo "Build a Hexagonix disk image... {" >> $LOG
echo >> $LOG
echo "> Building temporary image for file manipulation..." >> $LOG

# Agora vamos checar qual o sistema host, para adaptar a lógica de criação de imagem
# de disco para cada um. Suportados até o momento: Linux e FreeBSD (FreeBSD em desenvolvimento)

if [ "$HOST" == "LINUX" ]; then

construirImagemLinux

fi

if [ "$HOST" == "BSD" ]; then

construirImagemBSD

fi

# Daqui em diante, a lógica é a mesma para todos os sistemas host suportados

echo "> Copying system files to the image..." >> $LOG
echo >> $LOG

cp $DESTINODISTRO/*.man Sistema/ >> $LOG || erroMontagem
cp $DESTINODISTRO/*.asm Sistema/ >> $LOG
cp $DESTINODISTRO/*.s Sistema/ >> $LOG
cp $DESTINODISTRO/*.cow Sistema/ >> $LOG || erroMontagem
cp $DESTINODISTRO/bin/* Sistema/ >> $LOG || erroMontagem
cp $DESTINODISTRO/hboot Sistema/ >> $LOG || erroMontagem

# A licença deve ser copiada

cp Dist/man/LICENSE Sistema/ >> $LOG || erroMontagem

# Agora, copiar módulos do HBoot

if [ -e $DESTINODISTRO/Spartan.mod ] ; then

cp $DESTINODISTRO/*.mod Sistema/ >> $LOG

fi

cp $DESTINODISTRO/etc/* Sistema/>> $LOG || erroMontagem
cp $DESTINODISTRO/*.ocl Sistema/ >> $LOG || erroMontagem

# Caso a imagem deva conter uma cópia dos arquivos do FreeDOS para testes...

if [ -e DOS ] ; then

cp DOS/*.* Sistema/

fi

# Agora será verificado se alguma fonte deverá ser incluída na imagem
#
# Se o arquivo de fonte padrão estiver disponível, usar essa informação como interruptor
# para ligar a cópia

echo -n "> Checking if there are graphic fonts to copy..." >> $LOG

if [ -e $DESTINODISTRO/aurora.fnt ] ; then

echo " [Yes]" >> $LOG

cp $DESTINODISTRO/*.fnt Sistema/ || erroMontagem

fi

if [ ! -e $DESTINODISTRO/aurora.fnt ] ; then

echo " [No]" >> $LOG

fi

checarContrib

echo >> $LOG

sleep 1.0 || erroMontagem

echo "> Unmounting the image..." >> $LOG

umount Sistema >> /dev/null || erroMontagem

if [ "$HOST" == "BSD" ]; then

mdconfig -d -u 4

fi

if [ "$HOST" == "UNIX" ]; then

lofiamd -d /dev/lofi/1

fi

echo "> Mounting the final image..." >> $LOG

echo "  * Copying temporary image to final image..." >> $LOG

dd status=none conv=notrunc if=temp.img of=$IMAGEM_DISCO_FINAL seek=1 >> $LOG || erroMontagem

echo "  * Copying MBR and partition table to image..." >> $LOG

dd status=none conv=notrunc if=$DESTINODISTRO/mbr.img of=$IMAGEM_DISCO_FINAL >> $LOG || erroMontagem

echo "> Removing temporary files and folders, as well as binaries that are no longer needed..." >> $LOG
echo >> $LOG

rm -rf Sistema $DESTINODISTRO temp.img >> $LOG

if test $VERBOSE -e 0; then

clear

elif test $VERBOSE -e 1; then

echo

fi

echo "> Moving files to final location..." >> $LOG

mv hexagonix.img $DIR_IMAGEM/$IMAGEM_DISCO_FINAL

echo "> Creating .vdi image from raw image..." >> $LOG

qemu-img convert -O vdi $DIR_IMAGEM/$IMAGEM_DISCO_FINAL $DIR_IMAGEM/$(basename $IMAGEM_DISCO_FINAL .img).vdi

# Vamos agora trocar a propriedade da imagem para um usuário comum

echo "> Adjusting file permissions (needed for git)..." >> $LOG

chown $DIR_IMAGEM/$IMAGEM_DISCO_FINAL --reference=$DIR_IMAGEM/README.md
chown $DIR_IMAGEM/$(basename $IMAGEM_DISCO_FINAL .img).vdi --reference=$DIR_IMAGEM/README.md

echo >> $LOG
echo "} Hexagonix disk images built successfully." >> $LOG
echo >> $LOG

export MSG="Build the Hexagonix"

banner

infoBuild

avisoCriarInstalador

finalizarLog

mv log.log $DIR_IMAGEM/log.log
chown $DIR_IMAGEM/log.log --reference=$DIR_IMAGEM/README.md

exit

}

#-------------------------------- Divisão --------------------------------#

# Código específico de geração de imagem de disco para o Linux

construirImagemLinux()
{

dd status=none bs=512 count=$TAMANHOTEMP if=/dev/zero of=temp.img >> $LOG || erroMontagem

if [ ! -e hexagonix.img ] ; then

echo >> $LOG
echo "> Building image that will receive system files..." >> $LOG
echo >> $LOG

dd status=none bs=$TAMANHOIMAGEM count=1 if=/dev/zero of=$IMAGEM_DISCO_FINAL >> $LOG || erroMontagem

fi

echo "> Copying bootloader (Saturno) to image..." >> $LOG

dd status=none conv=notrunc if=$DESTINODISTRO/saturno.img of=temp.img >> $LOG || erroMontagem

echo "> Mounting the image..." >> $LOG

mkdir -p Sistema && mount -o loop -t vfat temp.img Sistema/ || erroMontagem

}

# Código específico de geração de imagem de disco para o Solaris (OpenIndiana, illumos e derivados)

construirImagemUNIXSolaris()
{

dd status=none bs=512 count=$TAMANHOTEMP if=/dev/zero of=temp.img >> $LOG || erroMontagem

if [ ! -e hexagonix.img ] ; then

echo >> $LOG
echo "> Building image that will receive system files..." >> $LOG
echo >> $LOG

dd status=none bs=$TAMANHOIMAGEM count=1 if=/dev/zero of=$IMAGEM_DISCO_FINAL >> $LOG || erroMontagem

fi

echo "> Copying bootloader (Saturno) to image..." >> $LOG

dd status=none conv=notrunc if=$DESTINODISTRO/saturno.img of=temp.img >> $LOG || erroMontagem

echo "> Mounting the image..." >> $LOG

lofiadm -a temp.img

mkdir -p Sistema && mount -F lofs /dev/lofi/1 Sistema/ || erroMontagem

}

# Código específico de geração de imagem de disco para o FreeBSD

construirImagemBSD()
{

# Setores reservados = 16
# Fats = 2
# Entradas raiz = 512
# Setores por fat = 16
# Setores por trilha = 63
# Cabeças = 255
# Setores ocultos = 0
# Total setores = 92160

newfs_msdos -C 45m -F 16 -B $DESTINODISTRO/saturno.img temp.img

if [ ! -e hexagonix.img ] ; then

echo "> Building image that will receive system files..."

newfs_msdos -C 90m -F 16 hexagonix.img

fi

mdconfig -a -t vnode -f temp.img -o force -u 4

echo "> Mounting the image..." >> $LOG

mkdir -p Sistema && mount_msdosfs /dev/md4 Sistema/ || erroMontagem

}

#-------------------------------- Divisão --------------------------------#

checarContrib()
{

# Verificar se existem arquivos complementares a serem adicionados
# na imagem. Esses arquivos devem estar no diretório contrib.

if [ -e contrib/ ] ; then

cp contrib/* Sistema/

fi

}

#-------------------------------- Divisão --------------------------------#

# Sessão de gerenciamento de máquinas virtuais do hx

gerenciarMaquinaVirtual()
{

case $PT2 in

hx) mvHexagonixKVM; exit;;
hx.bsd) mvHexagonixSobreBSD; exit;;
hx.snd) mvHexagonixSnd; exit;;
hx.serial) mvHexagonixSerial; exit;;
*) mvHexagonixKVM; exit;; # Assumir hx -v hx

esac

}

mvHexagonixSnd()
{

export QEMU_ARGS="-serial file:Serial.txt -hda $CAMINHO_IMAGEM_DISCO -cpu $PROCESSADOR -m $MEMORIA -soundhw $DRV_SOM -k pt-br"
export NOTA="Using sound device"

mvExec

}

mvHexagonixSobreBSD()
{

export QEMU_ARGS="-cpu $PROCESSADOR -hda $CAMINHO_IMAGEM_DISCO -m $MEMORIA -k pt-br"
export NOTA="BSD mode"

mvExec

}

mvHexagonixKVM()
{


export QEMU_ARGS="--enable-kvm -serial file:Serial.txt -cpu host -hda $CAMINHO_IMAGEM_DISCO -m $MEMORIA -k pt-br"
export NOTA="Using KVM and serial output to file"

mvExec

}

mvHexagonixSerial()
{

export QEMU_ARGS="-serial stdio -hda $CAMINHO_IMAGEM_DISCO -cpu $PROCESSADOR -m $MEMORIA -k pt-br"
export NOTA="Using serial output to console"

mvExec

}

mvExec()
{

if [ -e $CAMINHO_IMAGEM_DISCO ] ; then

clear

export MSG="HX: start virtual machine"

banner

echo
echo -e "\e[1mStarting virtual machine with the following specifications:\e[0m"
echo
echo -e "> Image target architecture: \e[1;32m$ARCH_SISTEMA\e[0m"
echo -e "> Note: \e[1;32m$NOTA\e[0m"
echo -e "> Disk image: \e[1;32m$CAMINHO_IMAGEM_DISCO\e[0m"
echo -e "> Output sound: \e[1;32m$DRV_SOM\e[0m"
echo -e "> Memory: \e[1;32m$MEMORIA megabytes\e[0m; processor: \e[1;32m$PROCESSADOR\e[0m"
echo

qemu-system-$ARCH_SISTEMA $QEMU_ARGS -D /dev/null >> /dev/null || erroMV

else

erroMV

fi

}

erroMV()
{

clear

export MSG="HX: start virtual machine"

banner

echo -e "Error in request: disk image \e[1;94m'$CAMINHO_IMAGEM_DISCO'\e[0m not found or fail"
echo -e "\e[0min some virtual machine component or parameter."
echo -e " > \e[1;31mYou CANNOT boot the system without this error.\e[0m"
echo -e "Error in request: \e[1;94mproblem while running virtual machine\e[0m."
echo -e " > \e[1;31mTry running the virtual machine again\e[0m."
echo

}

#-------------------------------- Divisão --------------------------------#

# Sessão de utilidades do hx

limpar()
{

clear

export MSG="HX: clear system tree"

banner

echo "Performing system tree cleanup..."
echo -n " > Cleaning up generated components and system images..."

rm -rf Sistema $DESTINODISTRO Hexagonix temp.img hexagonix.img
rm -rf log.log COM1.txt *.sis *.bin *.app Serial.txt

echo -e " [\e[32mOk\e[0m]"
echo -e "   > \e[1;94mUse ./hx with parameters to regenerate these files.\e[0m"
echo -e "   > For help on possible parameters, use ./hx -h."
echo -n " > Removing configuration files generated every build..."

rm -rf Dist/etc/*.unx Dist/etc/*.ocl Dist/etc/rc Dist/etc/passwd Dist/etc/shrc

echo -e " [\e[32mOk\e[0m]"
echo -e "   > \e[1;94mUse ./configure.sh to regenerate these files.\e[0m"

tudopronto

echo

}

obterInfoBuild()
{

# Dados de versão do Hexagonix

export REVISAO=$(cat Dist/etc/release.def)
export CODENOME=$(cat Dist/etc/codenome.def)
export VERSAO=$(cat Dist/etc/versao.def)

}

infoBuild()
{

clear

export MSG="System information"

banner

echo -e "Information about the \e[1mcurrent\e[0m construction of the system:"
echo -e " > Hexagonix version: \e[1;32m$VERSAO\e[0m"
echo -e " > Software revision: \e[1;32m$REVISAO\e[0m"
echo -e " > Release name: \e[1;32m$CODENOME\e[0m"
echo -e " > Disk image location: \e[1;32m$DIR_IMAGEM/$IMAGEM_DISCO_FINAL\e[0m"
echo

}

executarConfigure()
{

clear

if [ -e configure.sh ] ; then

echo
echo -e "[\e[32mAllowing execution and starting configure.sh...\e[0m]"

# Primeiro, ter certeza que o arquivo pode ser executado

chmod +x configure.sh

./configure.sh

else

echo -e "[\e[31mError: configure.sh not found\e[0m]"
echo -e " > \e[1;31mYou CANNOT start building the system without this dependency\e[0m."

fi

terminar
tudopronto

}

terminar()
{

echo -e "[\e[32mStep completed successfully\e[0m]"

}

tudopronto()
{

echo -e "[\e[32mAll ready!\e[0m]"

}

verificarEstaticos()
{

# Vamos verificar se antes os arquivos estáticos essenciais já foram gerados.
# Se não, vamos gerá-los

if [ -e Dist/etc/base.ocl ] ; then

echo "Static files present."

else

clear

export MSG="Building the Hexagonix"

banner

echo "The static files needed to build the system were not found."
echo "Build could not be started. To do so, hx will run ./configure.sh"
echo "to set up the build and generate the necessary files."
echo
echo "Press <ENTER> to continue or CTRL-C to cancel..."

read resposta

./configure.sh

fi

}

exibirEstatisticas(){

clear

export MSG="Statistics"

banner

if [ -e /usr/bin/cloc ] ; then

for i in */
do

    echo
    echo -en "\e[1;94mStats of the directory $i:\e[0m"
    echo
    echo

    cloc $i

    terminar

done

    echo
    echo -en "\e[1;94mSystem global statistics:\e[0m"
    echo
    echo

    cloc $(pwd)

    terminar

tudopronto

else

echo
echo -e "[\e[1;31mCloc utility not found.\e[0m]"
echo -e "\e[1;94mHX cannot report statistics without this dependency.\e[0m"

fi

echo

}

verFlags()
{

clear

export MSG="Hexagonix build flags"

banner

echo "Common flags:"
echo -e " > \e[1;32m$FLAGS_COMUM\e[0m"
echo "Hexagon flags:"
echo -e " > \e[1;32m$FLAGS_HEXAGON\e[0m"
echo "HBoot build flags:"
echo -e " > \e[1;32m$FLAGS_HBOOT\e[0m"
echo

tudopronto
terminar

}

iniciarLog()
{

if [ -e $LOG ] ; then

rm -r $LOG

fi

# Montar o cabeçalho do arquivo de log...

echo "Hexagonix Operating System build and statistics report" >> $LOG
echo "-------------------------------------------------------" >> $LOG
echo >> $LOG
echo "Hexagonix Operating System" >> $LOG
echo "Copyright (C) 2015-2023 Felipe Miguel Nery Lunkes. All rights reserved." >> $LOG
echo >> $LOG
echo "Hexagonix is licenced under BSD-3-Clause and comes with no warranty." >> $LOG
echo >> $LOG
echo "-------------------------------------------------------" >> $LOG
echo >> $LOG
echo "In this file, you have access to the complete log of the build process of" >> $LOG
echo "Hexagonix components. You can also use it to identify the environment used in" >> $LOG
echo "construction, as well as errors found in the process." >> $LOG
echo >> $LOG
echo "hx version: $VERSAOHX" >> $LOG
echo >> $LOG
echo "Information about the current build of Hexagonix:" >> $LOG
echo " > Hexagonix version: $VERSAO" >> $LOG
echo " > Software revision: $REVISAO" >> $LOG
echo " > Release name: $CODENOME" >> $LOG
echo " > Disk image location: $DIR_IMAGEM/$IMAGEM_DISCO_FINAL" >> $LOG
echo " > Branch (git): $RAMO" >> $LOG
echo >> $LOG
echo "Information about the current build environment:" >> $LOG
echo -n " > Date and time of this report (build time): " >> $LOG
date >> $LOG
echo -n " > User currently logged in: " >> $LOG
whoami >> $LOG
echo -n " > Operating system details: " >> $LOG
uname -srmpi >> $LOG
echo -n " > fasm version: " >> $LOG
fasm | grep "flat" >> $LOG
echo -n " > GNU bash version: " >> $LOG
bash --version | grep "GNU bash" >> $LOG

# Vamos agora verificar a versão de ferramentas opcionais, como qemu, NASM e vscode

if [ -e /usr/bin/qemu-system-i386 ] ; then

echo -n " > qemu version: " >> $LOG
qemu-system-i386 --version | grep "QEMU emulator" >> $LOG

fi

if [ -e /usr/bin/nasm ] ; then

echo -n " > nasm version: " >> $LOG
nasm --version >> $LOG

fi

if [ -e /usr/bin/VirtualBox ] ; then

echo -n " > VirtualBox version: " >> $LOG
vboxmanage --version >> $LOG

fi

if [ -e /usr/bin/code ] ; then

echo -n " > vscode version: " >> $LOG
code --version --no-sandbox --user-data-dir /dev/null | head -n 1 >> $LOG

fi

echo >> $LOG
echo "----------------------------------------------------------------------" >> $LOG
echo >> $LOG

}

avisoCriarInstalador()
{

echo "> Disk image '$IMAGEM_DISCO_FINAL' and VM disk image '$(basename $IMAGEM_DISCO_FINAL .img).vdi' generated successfully." >> $LOG
echo >> $LOG
echo "Use './hx -v hx' to test running the system on the generated image or copy" >> $LOG
echo "the image to the installer 'Inst' directory to generate an Linux-based install" >> $LOG
echo "image for transfer to physical disk." >> $LOG
echo >> $LOG
echo "----------------------------------------------------------------------" >> $LOG
echo >> $LOG

}

finalizarLog()
{

echo -n "Finalization date of this log: " >> $LOG
date >> $LOG
echo >> $LOG
echo "----------------------------------------------------------------------" >> $LOG
echo >> $LOG

}

instalarDependencias()
{

if test "`whoami`" != "root" ; then

sureq

exit

fi

export MSG="Install dependencies"

banner

echo
echo -e "HX will now install the necessary dependencies to run it:"
echo

apt install fasm nasm cloc qemu qemu-system-i386

terminar

echo
echo -e "\e[1mReady! Now run \e[32m./configure.sh\e[0;1m to configure the dependencies."

tudopronto

echo

}

banner()
{

echo -e ";;****************************************************************************"
echo -e ";;                                                                            "
echo -e ";; ┌┐ ┌┐                              \e[1;94mHexagonix Operating System\e[0m"
echo -e ";; ││ ││                                                                      "
echo -e ";; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐ \e[1;94mCopyright © 2015-2023 Felipe Miguel Nery Lunkes\e[0m"
echo -e ";; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘             \e[1;94mAll rights reserved.\e[0m  "
echo -e ";; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐                                                "
echo -e ";; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘                                                "
echo -e ";;              ┌─┘│                       \e[1;32m$MSG\e[0m"
echo -e ";;              └──┘                                                          "
echo -e ";;                                                                            "
echo -e ";;****************************************************************************"
echo

}

atualizarImagens()
{

export MSG="Update images"

banner

echo "You are about to update the Hexagonix disk images by synchronizing them"
echo "with those available in the image repository, in the main (stable) branch."
echo -e "\e[1;31mWarning! This process will destroy any modifications within the local images!\e[0m"
echo
echo
echo -n "Do you want to continue [y/N] (press ENTER after selection): "

read OPCAO

case $OPCAO in

y) atualizarAutorizado; exit;;
Y) atualizarAutorizado; exit;;
n) finalizar; exit;;
N) finalizar; exit;;
*) finalizar; exit;;

esac

}

atualizarAutorizado()
{

cd hexagonix

rm -rf hexagonix.img hexagonix.vdi

wget https://github.com/hexagonix/hexagonix/blob/main/hexagonix.img
wget https://github.com/hexagonix/hexagonix/blob/main/hexagonix.vdi

terminar
tudopronto

}

infoRepo()
{

export MSG="Repos information"

banner

echo
echo "Currently, you are using this configuration for the repositories:"
echo -e " > Branch: \e[1;94m$RAMO\e[0m"
echo -e " > Server: \e[1;94mhttps://github.com/hexagonix\e[0m"
echo

terminar
tudopronto

}

atualizarRepos()
{

export MSG="Update repos"

banner

echo "You are about to update all repositories with the server, keeping current"
echo "branch. To change branch and update, use hx -un <branch>."
echo
echo "Update info:"
echo -e " > Branch: \e[1;94m$RAMO\e[0m"
echo -e " > Server: \e[1;94mhttps://github.com/hexagonix\e[0m"
echo
echo -e "> \e[1;32mUpdating repositories...\e[0m"
echo

cd Apps/Unix && git pull
cd ..
cd Andromeda && git pull
cd ..
cd ..
cd Boot/Saturno && git pull
cd ..
cd "Hexagon Boot" && git pull
cd ..
cd ..
cd Dist/etc && git pull
cd ..
cd man && git pull
cd ..
cd ..
cd Doc && git pull
cd ..
cd Contrib/fasmX && git pull
cd ..
cd ..
cd Fontes && git pull
cd ..
cd Hexagon && git pull
cd ..
cd hexagonix && git pull
cd ..
cd lib && git pull
cd ..
cd Scripts && git pull

echo
echo -e "> \e[1;32mUpdating building scripts and utilities...\e[0m"
echo

cp hx configure.sh ../
cp Contrib.sh ../Contrib/

cd ..

chmod +x configure.sh hx Contrib/Contrib.sh

if [ -e autohx.py ] ; then

# O autohx está presente e deve ser atualizado

cd autohx && git pull

cp autohx.py ../

cd ..

chmod +x autohx.py

fi

terminar
tudopronto

}

trocarRamoAtualizar()
{

export MSG="Update branch and repositories"

banner

echo "You are about to update all system repositories with the server,"
echo "after switching to the given branch."
echo
echo "Update info:"
echo -e " > Branch: \e[1;94m$PT2\e[0m"
echo -e " > Server: \e[1;94mhttps://github.com/hexagonix\e[0m"
echo
echo -e "> \e[1;32mUpdating repositories...\e[0m"
echo

cd Apps/Unix && git switch $PT2 && git pull
cd ..
cd Andromeda && git switch $PT2 && git pull
cd ..
cd ..
cd Boot/Saturno && git switch $PT2 && git pull
cd ..
cd "Hexagon Boot" && git switch $PT2 && git pull
cd ..
cd ..
cd Dist/etc && git switch $PT2 && git pull
cd ..
cd man && git switch $PT2 && git pull
cd ..
cd ..
cd Doc && git switch $PT2 && git pull
cd ..
cd Contrib/fasmX && git switch $PT2 && git pull
cd ..
cd ..
cd Fontes && git switch $PT2 && git pull
cd ..
cd Hexagon && git switch $PT2 && git pull
cd ..
cd hexagonix && git switch $PT2 && git pull
cd ..
cd lib && git switch $PT2 && git pull
cd ..
cd Scripts && git switch $PT2 && git pull

echo
echo -e "> \e[1;32mUpdating building scripts and utilities...\e[0m"
echo

cp hx configure.sh ../
cp Contrib.sh ../Contrib/
cd ..

chmod +x configure.sh hx Contrib/Contrib.sh

if [ -e autohx.py ] ; then

# O autohx está presente e deve ser atualizado

cd autohx && git pull

cp autohx.py ../

cd ..

chmod +x autohx.py

fi

terminar
tudopronto

}

clonarRepos()
{

clear

export MSG="Build the Hexagonix"

banner

echo "Cloning the repositories needed to build Hexagonix..."
echo

# Primeiro, vamos criar os diretórios comuns

cd Hexagonix

mkdir -p Apps/
mkdir -p Boot/
mkdir -p Contrib/
mkdir -p Dist/

# Vamos clonar o Hexagon

git clone https://github.com/hexagonix/Hexagon Hexagon

# Vamos clonar o Saturno e o HBoot

git clone https://github.com/hexagonix/Saturno Boot/Saturno
git clone https://github.com/hexagonix/HBoot "Boot/Hexagon Boot"

# Vamos agora clonar os respositórios de utilitários

git clone https://github.com/hexagonix/Unix-Apps Apps/Unix
git clone https://github.com/hexagonix/Andromeda-Apps Apps/Andromeda

# Vamos clonar as bibliotecas

git clone https://github.com/hexagonix/lib lib

# Agora vamos clocar arquivos estáticos e manuais

git clone https://github.com/hexagonix/man Dist/man
git clone https://github.com/hexagonix/etc Dist/etc

# Vamos clonar as fontes gráficas

git clone https://github.com/hexagonix/xfnt Fontes

# Agora, fasmX

git clone https://github.com/hexagonix/fasmX Contrib/fasmX

# Agora o repositório de imagens

git clone https://github.com/hexagonix/hexagonix hexagonix

# Agora, a documentação

git clone https://github.com/hexagonix/Doc

# Por último, os scripts de geração do sistema

git clone https://github.com/hexagonix/scriptsHX Scripts

# Agora, o utilitário autohx

git clone https://github.com/felipenlunkes/hexagonix-autobuild autohx

# Agora vamos colocar as coisas no lugar

cd Scripts

cp configure.sh hx ../
cp Contrib.sh ../Contrib

cd ..

cd autohx

cp autohx.py ../

cd ..

chmod +x configure.sh hx autohx.py

echo
echo -e "[\e[32mAll ready!\e[0m]"
echo

exit

}

checarDependenciasClonagem()
{

clear

export MSG="Build the Hexagonix"

banner

echo -e "Checking required dependencies to clone the repositories..."
echo

# Agora vamos verificar cada dependência do mecanismo de construção

# Dependência 1

echo -n " > git "

if [ -e /usr/bin/git ] ; then

echo -e "[\e[32mOk\e[0m]"

else

echo -e "[\e[31mNot found\e[0m]"
echo -e "   > \e[1;31mYou CANNOT start without this dependency\e[0m."

exit

fi

clonarRepos

}

finalizar()
{

exit

}

sureq()
{

clear

export MSG="HX: you need to be root"

banner

echo -e "\e[1;94mYou must be a root user to perform the requested action ;D\e[0m"
echo
echo -e "\e[1;32mEnter your password below to change to the root user (root) an run HX again with\e[0m"
echo -e "\e[1;32mgiven parameters.\e[0m"
echo

sudo hx $PT1 $PT2 $PT3 $PT4 $PT5

exit

}

#-------------------------------- Divisão --------------------------------#

#;;************************************************************************************

# Ponto de entrada do hx, definição de variáveis e processamento de parâmetros
#
#
# Copyright (C) 2015-2023 Felipe Miguel Nery Lunkes
# Todos os direitos reservados
# Constantes com informações de parâmetros

export NOMEHX=$0
export PT1=$1
export PT2=$2
export PT3=$3
export PT4=$4
export PT5=$5
export IDIOMA=$2
export IDIOMANG=$3

# Variáveis e constantes utilizados na montagem e no QEMU

# Constantes para execução da máquina virtual (QEMU)

export DRV_SOM="pcspk"
export ARCH_SISTEMA="i386"
export ARCH_SISTEMA_BSD="x86_64"
export PROCESSADOR="pentium3"
export MEMORIA=32

# Constantes da etapa de construção

export LOG="log.log"

# Constantes para as etapas de construção do sistema e criação de imagens. Essas são as flags
# padrão, e o podem ser alteradas por parâmetros para alterar o comportamento da construção
# ou componentes do Hexagonix

export CAMINHO_IMAGEM_DISCO="hexagonix/hexagonix.img" # Nome da imagem final
export DIR_IMAGEM="hexagonix" # Diretório da imagem final
export FLAGS_COMUM="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=PT" # Flags de construção gerais
export FLAGS_HEXAGON="VERBOSE=SIM" # Flags de construção do Hexagon
export FLAGS_HBOOT="TEMATOM=ANDROMEDA" # Flags de construção do HBoot
export DESTINODISTRO="Build" # Localização das imagens executáveis e arquivos estáticos gerados
export IMAGEM_DISCO_FINAL="hexagonix.img" # Nome da imagem final (sem diretório)
export Par="pt" # Parâmetro de idioma

if [ "$IDIOMA" == "en" ]; then

# Vamos alterar as flags para instruir a construção de versões em inglês (caso existam)

export FLAGS_COMUM="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=EN" # Flags de construção gerais
export IMAGEM_DISCO_FINAL="en.hexagonix.img" # Nome da imagem final (sem diretório)
export Par="en" # Parâmetro de idioma

fi

# Agora, vamos definir onde estão os cabeçalhos e bibliotecas da libasm (necessárias para o fasm)

export INCLUDE="$(pwd)/lib/fasm"

# Obter informações do ramo utilizado para a construção do sistema
#
# Aviso! A informação é obtida do repositório github.com/hexagonix/hexagonix, apenas. Não é
# recomendável construir o sistema usando ramos diferentes, mas utilizar todos os componentes
# vindos de um mesmo ramo, como CURRENT (main) ou RELEASE. A mistura entre os ramos pode
# provocar o não funcionamento ou funcionamento incorreto de diversos componentes. Para
# sincronizar todos os repositórios com o mesmo ramo, use 'hx -un ramo'.

if [ -e $CAMINHO_IMAGEM_DISCO ] ; then

# Caso uma imagem exista, vai ser utilizada para avaliar o ramo atual do sistema

cd hexagonix
export RAMO=$(git branch --show-current)
cd ..

fi

# Versão do hx

export VERSAOHX="13.15.2.1"

# Realizar a ação determinada pelo parâmetro fornecido

case $1 in

# Gerenciar os parâmetros iniciados com '-'

-v) gerenciarMaquinaVirtual; exit;;
-i) gerenciarConstrucao; exit;;
-h) exibirAjuda; exit;;
-b) gerenciarConstrucaoComponentes; exit;;
-br) infoRepo; exit;;
-u) atualizarRepos; exit;;
-ui) atualizarImagens; exit;;
-un) trocarRamoAtualizar; exit;;
-m) checarDependenciasClonagem; exit;;
-c) limpar; exit;;

# Gerenciar os parâmetros iniciados com '--'

--ver) exibirCopyright; exit;;
--depend) instalarDependencias; exit;;
--info) obterInfoBuild; infoBuild; exit;;
--configure) executarConfigure; exit;;
--stat) exibirEstatisticas; exit;;
--flags) verFlags; exit;;

# Função padrão

*) parametrosNecessarios; exit;;

esac