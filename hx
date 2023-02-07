#!/bin/bash
#
#;;************************************************************************************
#;;
#;;    
#;; ┌┐ ┌┐                                 Sistema Operacional Hexagonix®
#;; ││ ││
#;; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐    Copyright © 2016-2023 Felipe Miguel Nery Lunkes
#;; │┌─┐││─┼┼┼┤┌┐│┌┐│┌┐│┌┐┼┼┼┼┘          Todos os direitos reservados
#;; ││ │││─┼┼┼┤┌┐│└┘│└┘││││├┼┼┐
#;; └┘ └┴──┴┘└┴┘└┴─┐├──┴┘└┴┴┘└┘
#;;              ┌─┘│                 Licenciado sob licença BSD-3-Clause
#;;              └──┘          
#;;
#;;
#;;************************************************************************************
#;;
#;; Este arquivo é licenciado sob licença BSD-3-Clause. Observe o arquivo de licença 
#;; disponível no repositório para mais informações sobre seus direitos e deveres ao 
#;; utilizar qualquer trecho deste arquivo.
#;;
#;; BSD 3-Clause License
#;;
#;; Copyright (c) 2015-2023, Felipe Miguel Nery Lunkes
#;; All rights reserved.
#;; 
#;; Redistribution and use in source and binary forms, with or without
#;; modification, are permitted provided that the following conditions are met:
#;; 
#;; 1. Redistributions of source code must retain the above copyright notice, this
#;;    list of conditions and the following disclaimer.
#;;
#;; 2. Redistributions in binary form must reproduce the above copyright notice,
#;;    this list of conditions and the following disclaimer in the documentation
#;;    and/or other materials provided with the distribution.
#;;
#;; 3. Neither the name of the copyright holder nor the names of its
#;;    contributors may be used to endorse or promote products derived from
#;;    this software without specific prior written permission.
#;; 
#;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#;; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#;; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#;; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#;;
#;; $HexagonixOS$

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
echo -e "\e[1;32m hx.som\e[0m    - Start Hexagonix virtual machine in sound mode"
echo -e "\e[1;32m hx.serial\e[0m - Start Hexagonix virtual machine with no serial output"
echo -e "\e[1;32m bsd-hx\e[0m    - Start BSD host compatible virtual machine"
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

}

exibirCopyright() {

clear 

export MSG="Copyright"

banner

echo -e "\e[1;94mHX: Hexagonix® build and test tool version $VERSAOHX\e[0m"
echo
echo -e "Developed by \e[1;32mFelipe Miguel Nery Lunkes\e[0m"
echo 
echo -e "\e[0mCopyright © 2016-2023 Felipe Miguel Nery Lunkes\e[0m"
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

# Sessão de configuração para montagem do sistema

prepImagemHexagonix(){

verificarEstaticos

iniciarLog

definirHexagonixOficial
imagemHexagonix

}

prepImagemHexagonixBSD(){

verificarEstaticos

iniciarLog

definirHexagonixOficial
imagemHexagonixSobreBSD

}

prepImagemHexagonixTeste(){

verificarEstaticos

iniciarLog

definirHexagonixTeste
imagemHexagonix

}

definirHexagonixTeste()
{

# Aqui vamos gerar uma imagem pequena, de 2 Mb, menor e apenas para testes. Essa imagem
# não deve ser utilizada para o pacote de instalação.

export BANDEIRAS="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=PT"
export imagemFinal="hexagonix.img"
export Par="pt"

if [ "$PT2" = "en" ]; then

export BANDEIRAS="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=EN"
export imagemFinal="en.hexagonix.img"
export Par="en"

fi

export LOG="log.log"
export IMG="hexagonix.img"
export TAMANHOIMAGEM=2097012
export TAMANHOTEMP=2048	

}

definirHexagonixOficial()
{

# Aqui vamos definir uma imagem de tamanho oficial, que demora mais a ser gerada. Essa imagem é
# apropriada para o pacote de instalação do Hexagonix®

export LOG="log.log"
export IMG="hexagonix.img"
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

# Sessão de construtores individuais dos componentes do sistema

# Vamos separar aqui as etapas comuns de construção do sistema para reutilizar
# código e facilitar a busca de erros

construirHexagon(){

cd Hexagon

echo
echo -en "\e[1;94mBuilding the Hexagon® kernel...\e[0m"

echo "Hexagon® kernel..." >> ../log.log
echo >> ../log.log

fasm kern/Hexagon.asm Hexagon -d $BANDEIRASHEXAGON >> ../log.log || erroConstrucao

cp Hexagon ../$DESTINODISTRO/bin

rm -r Hexagon

echo -e " [\e[32mOk\e[0m]"

echo >> ../log.log
echo "Hexagon® kernel built successfully." >> ../log.log
echo >> ../log.log
echo "----------------------------------------------------------------------" >> ../log.log
echo >> ../log.log

cd ..

}

construirSaturno(){

echo -e "\e[1;94mHexagon® startup components...\e[0m {"
echo

echo "Hexagon® startup components... {" >> $REG
echo >> $REG

echo -e "\e[1;94mHexagon® bootloader - Saturno® (1st stage)...\e[0m"
echo

echo "Hexagon® bootloader - Saturno® (1st stage)..." >> $REG
echo >> $REG

cd Boot

cd Saturno

fasm saturno.asm ../saturno.img >> ../../log.log || erroConstrucao

echo >> ../../log.log

fasm mbr.asm ../mbr.img >> ../../log.log || erroConstrucao

echo >> ../../log.log

cd ..


}

construirHBoot(){

echo -e "\e[1;94mHexagon Boot - HBoot (2nd stage)...\e[0m"
echo

echo "Hexagon Boot - HBoot (2nd stage)..." >> ../log.log
echo >> ../log.log

cd "Hexagon Boot"

fasm hboot.asm ../hboot -d $BANDEIRASHBOOT >> ../../log.log || erroConstrucao

cd Mods

if [ -e Spartan.asm ] ; then

for i in *.asm
do

	echo -en "Building HBoot® compatible module \e[1;94m$(basename $i .asm).mod\e[0m..."
	
	fasm $i ../../`basename $i .asm`.mod -d $BANDEIRAS >> ../../../log.log 
	
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
echo "} Successfully built Hexagon® startup components." >> ../log.log
echo >> ../log.log
echo "----------------------------------------------------------------------" >> ../log.log
echo >> ../log.log

cd ..

}

construirUtilUnix(){

# Gerar os aplicativos base Unix

cd Apps/Unix

./Unix.sh $ALVODISTRO

cd ..

}

construirBaseAndromeda(){

# Gerar os aplicativos Hexagonix-Andromeda

cd $DESTINODISTRO
	
./Apps.sh

cd ..

cd ..

}

kernel()
{

kernel

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

# Sessão de construção coletiva dos componentes do sistema

gerenciarConstrucao()
{

obterInfoBuild

case $PT2 in

hx) prepImagemHexagonix; exit;;
hx.teste) prepImagemHexagonixTeste; exit;;
bsd) prepImagemHexagonixBSD; exit;;
*) prepImagemHexagonix; exit;; # Assimir hx -i hx

esac

}

gerenciarConstrucaoComponentes()
{

case $PT2 in

hexagon) construirHexagon; exit;;
HBoot) construirHBoot; exit;;
saturno) construirSaturno; exit;;
unixland) construirUtilUnix; exit;;
andromedaland) construirBaseAndromeda; exit;;
hexagonix) hexagonix; exit;;

*) parametrosNecessarios; exit;;

esac

}

construtorHexagonix()
{

export BANDEIRAS="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=PT"
export imagemFinal="hexagonix.img"

if [ "$IDIOMA" = "en" ]; then

export BANDEIRAS="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=EN"
export imagemFinal="en.hexagonix.img"

fi

export DESTINODISTRO="Andromeda"
export MSG="Building the Hexagonix®"

clear 

banner 

echo "Building the Hexagonix®..."
echo

mkdir -p $DESTINODISTRO
mkdir -p $DESTINODISTRO/bin
mkdir -p $DESTINODISTRO/etc

construirSaturno
construirHBoot
construirHexagon
construirUtilUnix
construirBaseAndromeda

cd Dist 

cd etc/

cp rc passwd ../../$DESTINODISTRO/etc
cp *.unx ../../$DESTINODISTRO/etc
cp base.ocl ../../$DESTINODISTRO/hexgnix.ocl

cd ..

cd man

cp *.man ../../$DESTINODISTRO

cd ..
cd ..

cd Fontes/

if [ -e aurora.asm ] ; then

echo -e "There are graphical fonts to be built and copied... [\e[32mOk\e[0m]"

./fontes.sh

cp *.fnt ../$DESTINODISTRO
rm *.fnt

echo
echo -n "Fonts copied"
echo -e " [\e[32mOk\e[0m]"
echo

else 

echo -e "There are no graphic fonts to build and copy... [\e[32mOk\e[0m]"
echo

fi

echo "Copying core development libraries..."
echo 

# Vamos copiar também o arquivo de cabeçalho para poder desenvolver sobre o Hexagonix(R)

cd ..

cd lib/fasm

cp hexagon.s ../../$DESTINODISTRO 

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

if [ -e Externos/Externos.sh ] ; then

cd Externos 

./Externos.sh Andromeda

cd ..

else 

echo "There are no third-party applications marked for construction."
echo 

fi 

cd Dist 

echo
echo "View the 'log.log' log file for more information of the build."
echo

cd ..

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

# Sessão de criação de imagem do sistema

imagemHexagonix()
{

if test "`whoami`" != "root" ; then

sureq

exit

fi

# Agora os arquivos do Sistema serão gerados...

construtorHexagonix $Par

# Agora a imagem do Sistema será preparada...

echo -e "\e[1;94mBuilding system image...\e[0m"
echo

echo "Building temporary image for file manipulation......" >> $LOG

dd status=none bs=512 count=$TAMANHOTEMP if=/dev/zero of=temp.img >> $LOG || erroMontagem

if [ ! -e hexagonix.img ] ; then

echo >> $LOG
echo "Building image that will receive system files..." >> $LOG
echo >> $LOG

dd status=none bs=$TAMANHOIMAGEM count=1 if=/dev/zero of=$IMG >> $LOG || erroMontagem
	
fi	

echo "> Copying bootloader to image..." >> $LOG

dd status=none conv=notrunc if=$DESTINODISTRO/saturno.img of=temp.img >> $LOG || erroMontagem

echo "> Mounting the image..." >> $LOG
 
mkdir -p Sistema && mount -o loop -t vfat temp.img Sistema/ || erroMontagem

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

echo >> $LOG
echo -n "> Checking if there are grpahical fonts to copy..." >> $LOG

if [ -e $DESTINODISTRO/aurora.fnt ] ; then

echo " [Yes]" >> $LOG

cp $DESTINODISTRO/*.fnt Sistema/ || erroMontagem
	
fi	

if [ ! -e $DESTINODISTRO/aurora.fnt ] ; then

echo " [No]" >> $LOG
	
fi	

echo >> $LOG

sleep 1.0 || erroMontagem

echo "> Unmounting the image..." >> $LOG

umount Sistema >> /dev/null || erroMontagem

echo "> Mounting the final image..." >> $LOG

echo "  * Copying temporary image to final image..." >> $LOG

dd status=none conv=notrunc if=temp.img of=$IMG seek=1 >> $LOG || erroMontagem 

echo "  * Copying MBR and partition table to image and finalizing it..." >> $LOG

dd status=none conv=notrunc if=$DESTINODISTRO/mbr.img of=$IMG >> $LOG || erroMontagem

echo "> Removing temporary files and folders, as well as binaries that are no longer needed..." >> $LOG
echo >> $LOG

rm -rf Sistema $DESTINODISTRO temp.img >> $LOG

if test $VERBOSE -e 0; then

clear

elif test $VERBOSE -e 1; then

echo 

fi

mv hexagonix.img $dirImagem/$imagemFinal

qemu-img convert -O vdi $dirImagem/$imagemFinal $dirImagem/$(basename $imagemFinal .img).vdi 

# Vamos agora trocar a propriedade da imagem para um usuário comum

chown $dirImagem/$imagemFinal --reference=$dirImagem/README.md
chown $dirImagem/$(basename $imagemFinal .img).vdi --reference=$dirImagem/README.md

export MSG="Build the Hexagonix"

banner 

infoBuild

avisoCriarInstalador

exit

}

imagemHexagonixSobreBSD()
{


if test "`whoami`" != "root" ; then

sureq

exit

fi

# Agora os arquivos do Sistema serão gerados...

construtorHexagonix $Par

# Agora a imagem do Sistema será preparada...

echo -e "\e[1;94mBuilding system image...\e[0m"
echo

echo "Building temporary image for file manipulation......"

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

echo "Building image that will receive system files..." 

newfs_msdos -C 90m -F 16 hexagonix.img
	
fi	

# BSD logic

mdconfig -a -t vnode -f temp.img -o force -u 4

# "Normal" logic 

echo "> Mounting the image..." >> $LOG
 
mkdir -p Sistema && mount_msdosfs /dev/md4 Sistema/ || erroMontagem

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

echo >> $LOG
echo -n "> Checking if there are grpahical fonts to copy..." >> $LOG

if [ -e $DESTINODISTRO/aurora.fnt ] ; then

echo " [Yes]" >> $LOG

cp $DESTINODISTRO/*.fnt Sistema/ || erroMontagem
	
fi	

if [ ! -e $DESTINODISTRO/aurora.fnt ] ; then

echo " [No]" >> $LOG
	
fi	

echo >> $LOG

sleep 1.0 || erroMontagem

echo "> Unmounting the image..." >> $LOG

sync 

umount Sistema >> /dev/null || erroMontagem
mdconfig -d -u 4

echo "> Mounting the final image..." >> $LOG

echo "  * Copying temporary image to final image..." >> $LOG

dd status=none conv=notrunc if=temp.img of=$IMG seek=1 >> $LOG || erroMontagem 

echo "  * Copying MBR and partition table to image and finalizing it..." >> $LOG

dd status=none conv=notrunc if=$DESTINODISTRO/mbr.img of=$IMG >> $LOG || erroMontagem

echo "> Removing temporary files and folders, as well as binaries that are no longer needed..." >> $LOG
echo >> $LOG

rm -rf Sistema $DESTINODISTRO temp.img >> $LOG

if test $VERBOSE -e 0; then

clear

elif test $VERBOSE -e 1; then

echo 

fi

mv hexagonix.img $dirImagem/$imagemFinal

qemu-img convert -O vdi $dirImagem/$imagemFinal $dirImagem/$(basename $imagemFinal .img).vdi 

# Vamos agora trocar a propriedade da imagem para um usuário comum

chown $dirImagem/$imagemFinal --reference=$dirImagem/README.md
chown $dirImagem/$(basename $imagemFinal .img).vdi --reference=$dirImagem/README.md

export MSG="Build the Hexagonix"

banner 

infoBuild

avisoCriarInstalador

exit

}

# Sessão de gerenciamento de máquinas virtuais do hx

gerenciarMaquinaVirtual()
{

case $PT2 in

bsd-hx) mvHexagonixSobreBSD; exit;;
hx) mvHexagonixKVM; exit;;
hx.som) mvHexagonixSnd; exit;;
hx.serial) mvHexagonixSerial; exit;;
*) mvHexagonixKVM; exit;; # Assumir hx -v hx

esac

}

mvHexagonixSnd()
{

if [ -e $imagem ] ; then

clear

export MSG="HX: start virtual machine"

banner 

echo
echo -e "\e[1mStarting virtual machine with the following specifications:\e[0m"
echo
echo -e "> Image target architecture: \e[1;32m$sistema\e[0m"
echo -e "> Disk image: \e[1;32m$imagem\e[0m"
echo -e "> Output sound: \e[1;32m$drvsom\e[0m"
echo -e "> Memory: \e[1;32m$memoria megabytes\e[0m; processor: \e[1;32m$processador\e[0m"
echo

qemu-system-$sistema -serial file:"Serial.txt" -hda $imagem -cpu $processador -m $memoria -soundhw $drvsom >> /dev/null || erroMV

else

erroMV

fi	
	
}	

mvHexagonixSobreBSD()
{

if [ -e $imagem ] ; then

clear

export MSG="HX: start virtual machine"

banner 

echo -e "\e[1mStarting virtual machine with the following specifications:\e[0m"
echo
echo -e "\e[1;31mUsing parameters compatible with BSD systems (FreeBSD as a model)\e[0m"
echo
echo -e "> Image target architecture: \e[1;32m$sistemaBSD\e[0m; \e[1;31mBSD mode!\e[0m"
echo -e "> Disk image: \e[1;32m$imagem\e[0m"
echo -e "> Output sound: \e[1;32m$drvsom\e[0m"
echo -e "> Memory: \e[1;32m$memoria megabytes\e[0m; processor: \e[1;32m$processador\e[0m"
echo

qemu-system-$sistemaBSD -cpu $processador -hda $imagem -m $memoria >> /dev/null || erroMV

else

erroMV

fi	

}	

mvHexagonixKVM()
{

if [ -e $imagem ] ; then

clear

export MSG="HX: start virtual machine"

banner 

echo -e "\e[1mStarting virtual machine with the following specifications:\e[0m"
echo
echo -e "> Image target architecture: \e[1;32m$sistema\e[0m; Using KVM!"
echo -e "> Disk image: \e[1;32m$imagem\e[0m"
echo -e "> Output sound: \e[1;32m$drvsom\e[0m"
echo -e "> Memory: \e[1;32m$memoria megabytes\e[0m; processor: \e[1;32mhost\e[0m"
echo

qemu-system-$sistema --enable-kvm -serial file:"Serial.txt" -cpu host -hda $imagem -m $memoria >> /dev/null || erroMV

else

erroMV

fi	

}	

mvHexagonixSerial()
{

if [ -e $imagem ] ; then

clear

export MSG="HX: start virtual machine"

banner 

echo -e "\e[1mStarting virtual machine with the following specifications:\e[0m"
echo
echo -e "> Image target architecture: \e[1;32m$sistema\e[0m"
echo -e "> Disk image: \e[1;32m$imagem\e[0m"
echo -e "> Output sound: \e[1;32m$drvsom\e[0m"
echo -e "> Memory: \e[1;32m$memoria megabytes\e[0m; processor: \e[1;32m$processador\e[0m"
echo

qemu-system-$sistema -serial stdio -hda $imagem -cpu $processador -m $memoria >> /dev/null || erroMV

else

erroMV

fi	
	
}	

erroMV()
{
	
clear

export MSG="HX: start virtual machine"

banner 

echo -e "Error in request: \e[1;94m disk image '$imagem' not found or failed\e[0m"
echo -e "\e[0min some given component or parameter."
echo -e " > \e[1;31mYou CANNOT boot the system without this dependency\e[0m."
echo -e "Error in request: \e[1;94mproblem while running virtual machine\e[0m."
echo -e " > \e[1;31mTry running the virtual machine again\e[0m."
echo
	
}

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

rm -rf Dist/etc/*.unx Dist/etc/*.ocl Dist/etc/rc Dist/etc/passwd

echo -e " [\e[32mOk\e[0m]"
echo -e "   > \e[1;94mUse ./configure.sh to regenerate these files.\e[0m"

tudopronto

echo
		
}

obterInfoBuild()
{

# Dados de versão do Hexagonix

export REVISAO=$(cat Dist/etc/revisao.def) 
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
echo -e " > Disk image location: \e[1;32m$dirImagem/$imagemFinal\e[0m"
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


iniciarLog()
{

if [ -e $REG ] ; then

rm -r $REG
	
fi	

# Montar o cabeçalho do arquivo de log...

echo "Hexagonix® Operating System build and statistics report" >> $REG
echo "-------------------------------------------------------" >> $REG
echo >> $REG
echo "In this file you can find data and build information" >> $REG
echo "of the system files, being able to identify errors among other things" >> $REG
echo "in process." >> $REG
echo >> $REG
echo "hx version: $VERSAOHX" >> $REG
echo >> $REG
echo "Information about the current construction of the system:" >> $REG
echo " > Hexagonix version: $VERSAO" >> $REG
echo " > Software revision: $REVISAO" >> $REG
echo " > Release name: $CODENOME" >> $REG
echo " > Disk image location: $dirImagem/$imagemFinal" >> $REG
echo >> $REG
echo -n "Date and time of this report: " >> $REG
date >> $REG
echo >> $REG
echo -n "User currently logged in: " >> $REG
whoami >> $REG
echo >> $REG
echo "------------------------------------------------ ----------------------" >> $REG
echo >> $REG

}

avisoCriarInstalador()
{

echo "> Disk image '$IMG' and VM disk image '$(basename $imagemFinal .img).vdi' generated successfully." >> $LOG
echo >> $LOG
echo "Use './hx -v hx' to test running the system on the generated image or copy" >> $LOG
echo "the image to the installer 'Inst' directory to generate an Linux-based install" >> $LOG
echo "image for transfer to physical disk." >> $LOG
echo >> $LOG
echo "------------------------------------------------ ----------------------" >> $LOG
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
echo -e ";;                                                                            "
echo -e ";; ┌┐ ┌┐                              \e[1;94mHexagonix® Operating System\e[0m"
echo -e ";; ││ ││                                                                      "
echo -e ";; │└─┘├──┬┐┌┬──┬──┬──┬─┐┌┬┐┌┐ \e[1;94mCopyright © 2016-2023 Felipe Miguel Nery Lunkes\e[0m"
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
cd Externos/fasmX && git pull
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
cp Externos.sh ../Externos/
cd ..

chmod +x configure.sh hx Externos/Externos.sh

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
cd Externos/fasmX && git switch $PT2 && git pull
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
cp Externos.sh ../Externos/
cd ..

chmod +x configure.sh hx Externos/Externos.sh

terminar
tudopronto

}

clonarRepos()
{

clear

export MSG="Build the Hexagonix®"

banner 

echo "Cloning the repositories needed to build Hexagonix®..."
echo 

# Primeiro, vamos criar os diretórios comuns

cd Hexagonix 

mkdir -p Apps/
mkdir -p Boot/
mkdir -p Externos/
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

git clone https://github.com/hexagonix/fasmX Externos/fasmX

# Agora o repositório de imagens

git clone https://github.com/hexagonix/hexagonix hexagonix

# Agora, a documentação

git clone https://github.com/hexagonix/Doc

# Por último, os scripts de geração do sistema

git clone https://github.com/hexagonix/scriptsHX Scripts

# Agora vamos colocar as coisas no lugar 

cd Scripts 

cp configure.sh hx ../
cp Externos.sh ../Externos

cd ..

chmod +x configure.sh hx 

echo
echo -e "[\e[32mAll ready!\e[0m]"
echo

exit 

}

checarDependenciasClonagem()
{

clear

export MSG="Build the Hexagonix®"

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
echo -e "\e[1;32mEnter your password below to change to the root user (root) and then\e[0m"
echo -e "\e[1;32mrun HX again, with the desired parameters.\e[0m"
echo
echo -e "\e[1;94mHint: use \e[1;32m./hx help\e[1;94m to get available parameters.\e[0m"
echo

su root

exit 

} 

#;;************************************************************************************

# Ponto de entrada do hx, definição de variáveis e processamento de parâmetros
#
#
# Copyright (C) 2015-2023 Felipe Miguel Nery Lunkes
# Todos os direitos reservados

# Variáveis e constantes utilizados na montagem e no QEMU

# Constantes para execução da máquina virtual (QEMU) 

export drvsom="pcspk"
export sistema="i386"
export sistemaBSD="x86_64"
export processador="pentium3"
export memoria=32

# Constantes para as etapas de construção do sistema e criação de imagens

export REG="log.log"
export imagem="hexagonix/hexagonix.img"
export dirImagem="hexagonix"

# Agora vamos exportar flags (bandeiras) para as etapas de montagem e/ou compilação

export BANDEIRAS="UNIX=SIM -d TIPOLOGIN=Hexagonix -d VERBOSE=SIM -d IDIOMA=PT"
export BANDEIRASHEXAGON="VERBOSE=SIM"
export BANDEIRASHBOOT="TEMATOM=ANDROMEDA"

cd hexagonix 
export RAMO=$(git branch --show-current)
cd ..

# Constantes com informações de parâmetros

export NOMEHX=$0
export PT2=$2
export PT3=$3
export PT4=$4
export PT5=$5
export IDIOMA=$2
export IDIOMANG=$3

# Versão do hx

export VERSAOHX="13.9"

# Agora, vamos definir onde estão os cabeçalhos e bibliotecas da libasm (necessárias para o fasm)

export INCLUDE="$(pwd)/lib/fasm"

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
--info) infoBuild; exit;;
--configure) executarConfigure; exit;;
--stat) exibirEstatisticas; exit;;

# Função padrão

*) parametrosNecessarios; exit;;

esac 