***RelationalDoi***




instalação
# cd ojs-3.2.1-1/plugins/generic/relationalDoi/
-Instlar o plugin nas configurações do portal(/index.php/index/admin/settings)
-Instalar o plugin nas configurações da revista
-Em /ojs-3.2.1-1 dar o seguinte comando:
# php tools/upgrade.php upgrade
-Na administração do site (index.php/index/admin) limpar om cachê de template




publicname = "Relational DOI"



Este Plugin depende diretamente do Pugin DOI (nativo) e auxiliará na exportação de DOI's de arquivos independentes (galley) para a Crossref.

Generic Plugin para mostrar os DOI's relacionados de cada arquivo independente (galley).
Mostra os DOI's de arquivo de qualquer extensão.
Faltam algumas correções, mas a maior parte está feita. 
É necessário testar utilizado diferentes configurações do plugin DOI (sintáse da construção de DOI e sufixo) para ver como se comporta.

Prints de exemplos:

![image](https://user-images.githubusercontent.com/114300053/216448353-064cfb13-c28a-4db9-9388-cd57cf3fb286.png)


![image](https://user-images.githubusercontent.com/114300053/216448521-00e61bd0-2b5e-4f8b-adad-ea37d81712ea.png)


O arquivo /templates/frontend/objects/article_details.tpl tem os pontos de edição marcados em seu código da seguinte forma:

{** find00: para entender: aqui se forma o doi do view, nessa parte não precisa mudar nada *}

{** find01: aqui fica e mostra o doi do view *}

{** find02: mudanças a partir daqui. Aqui ficam os pdfs, galley, o original e a tradução, cada um tem um doi independente do doi do view *}

{** find03: aqui ficam os outros arquivos, jpg, png, html, também com doi independente *}

{** find04: não editar nada a partir daqui*}

***Atenção***
Além de ser necessário testes com outras sintáses da construção de DOI, o plugin atual para criar o link e referencia-lo funciona com a regra:

""<span class="value">
			<a href="{$doiUrl}.g{$galley->getBestGalleyId()|escape}">
                {$doiUrl}.g{$galley->getBestGalleyId()|escape}
       </a>
</span>""

sendo o ".g" funcional apenas para a configuração padrão de SUFIXO do Plugin DOI quando configurado da seguinte forma:

![image](https://user-images.githubusercontent.com/114300053/216457698-7de5c12d-e5d7-478d-935e-7a7b547e2504.png)
