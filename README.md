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
Mostra os DOI's de arquivo de qualquer extensão através de um botão.
Faltam algumas correções, mas a maior parte está feita. 
É necessário testar utilizado diferentes configurações do plugin DOI (sintáse da construção de DOI e sufixo) para ver como se comporta.

Prints de exemplos:
![image](https://user-images.githubusercontent.com/114300053/216850242-82142a22-2dc7-457e-8a2f-4fb00bd80e55.png)
![image](https://user-images.githubusercontent.com/114300053/216850268-058f893e-daa2-4966-9d36-911b22709e5d.png)





***Atenção***
Além de ser necessário testes com outras sintáses da construção de DOI, o plugin atual para criar o link e referencia-lo funciona com a regra:

""<span class="value">
			<a href="{$doiUrl}.g{$galley->getBestGalleyId()|escape}">
                {$doiUrl}.g{$galley->getBestGalleyId()|escape}
       </a>
</span>""

sendo o ".g" funcional apenas para a configuração padrão de SUFIXO do Plugin DOI quando configurado da seguinte forma:

![image](https://user-images.githubusercontent.com/114300053/216457698-7de5c12d-e5d7-478d-935e-7a7b547e2504.png)
