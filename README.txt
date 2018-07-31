Arquivos referentes ao primeiro trabalho da disciplina de
Arquitetura e Organização de Computadores II.

Discente: Leonardo Vendrame	                    RA: 90562

Dentro das pastas de cada algoritmo existe uma pasta
chamada origin_out que contem os stats resultantes
das simulações efetuadas para o trabalho. Para a execução
do script as saidas ficarão na pasta out_files, também 
dentro das pastas de seus respectivos algoritmos.

--- Como executar ---

Para a execução do script é necessário fornecer o caminho 
completo para a pasta do gem5 compilado. Basta abrir os 
scripts make_and_run.sh e just_run.sh e editar a linha 
contendo GEM5_CDIR passando o caminho desde a raiz até o gem5.

Além disso será necessário dar permissão para executar cada
um dos scripts, o que pode ser feito com os comandos:
chmod +x make_and_run.sh
chmod +x just_run.sh

Existem 2 scripts que se dão por:

O script make_and_run.sh entrará em cada uma das pastas e 
executará a compilação de cada programa através de seus respectivos
Makefiles e após a compilação de todos executará um a um dentro
do ambiente pré-configurado do Gem5. Para isso é necessário o caminho
completo do Gem5 na linha especificada dentro do script.

O script just_run.sh apenas executará cada um dos programas dentro
do ambiente Gem5. Note que é necessário que os programas já estejam compilados
com seus respectivos Makefiles e que o caminho para a pasta do Gem5 esteja
correta dentro do script.

Outros comandos disponíveis:
make   			# Compila todos os programas
make clean		# Remove os arquivos gerados no make (arquivos de execução dos programas)
make cleanresuts	# Remove os arquivos resultantes das execuções da simulação através dos scripts
make cleanrelat		# Remove os arquivos gerados pela compilação e o relatório
----------------------
