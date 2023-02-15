***RelationalDoi***




instalação
cd ojs-3.2.1-1/plugins/generic/relationalDoi/
-Instlar o plugin nas configurações do portal(/index.php/index/admin/settings)
-Instalar o plugin nas configurações da revista
-Em /ojs-3.2.1-1 dar o seguinte comando:
php tools/upgrade.php upgrade
-Na administração do site (index.php/index/admin) limpar om cachê de template




publicname = "Relational DOI"



Este Plugin depende diretamente do Pugin DOI (nativo) e auxiliará na exportação de DOI's de arquivos independentes (galley) para a Crossref.

Generic Plugin para mostrar os DOI's relacionados de cada arquivo independente (galley).
Mostra os DOI's de arquivo de qualquer extensão através de um botão.
Faltam algumas correções, mas a maior parte está feita. 

Este plugin depende das informações do plugin DOI e também afeta o mesmo em suas configurações
-funciona com a configuração padrão de DOI:
![image](https://user-images.githubusercontent.com/114300053/219038364-985fd6c4-c769-488d-9129-124aa84cb0ff.png)

-Funciona com a configuração "padrão informado manualmente" com qualquer tipo de formatação
![image](https://user-images.githubusercontent.com/114300053/219038979-b6f2f755-cfab-43b4-af7f-6be32c01af75.png)

-Ainda não funciona com as configurações de doi individual para cada item publicado
![image](https://user-images.githubusercontent.com/114300053/219039231-59012c46-b654-481f-977f-03ecae63c7a5.png)
pois há um entrave que estou procurando solução. Preciso pegar a informação de DOI registrado manualmente, que é inserido em "workflow>publicação>identificadores" que é formada através do código php do arquivo DOIPubIdPlugin.inc.php:

"// Add a text field to enter the DOI if no pattern exists
		if (!$pattern) {
			$form->addField(new \PKP\components\forms\FieldText('pub-id::doi', [
				'label' => __('metadata.property.displayName.doi'),
				'description' => __('plugins.pubIds.doi.editor.doi.description', ['prefix' => $prefix]),
				'value' => $form->publication->getData('pub-id::doi'),
			]));"
	... e resgatar essa informação dentro do arquivo "doiSuffixEdit.tpl" desse plugin.



Prints de exemplos:
![image](https://user-images.githubusercontent.com/114300053/216850242-82142a22-2dc7-457e-8a2f-4fb00bd80e55.png)
![image](https://user-images.githubusercontent.com/114300053/216850268-058f893e-daa2-4966-9d36-911b22709e5d.png)





***Atenção***
A ideia desse plugin é formar o DOI dos arquivos, idenpendente da regra de formatação que os editores colocarem para o sufixo doi. Os arquivos terão seus DOI's gerados respeitando o DOI do artigo e adicionando regra de objetos galley. 

Quando se usa a configuração predefinida no plugin DOI o resultado é:
Artigo: https://doi.org/10.11607/um.v33i33.15 
Arquivo a: https://doi.org/10.11607/um.v33i33.15.g55 
Arquivo b: https://doi.org/10.11607/um.v33i33.15.g56

Quando se usa a configuração padrão informado manualmente no plugin DOI o resultado é:
exemplo: issn.2176-1507.v%vf%fp%p
Artigo: https://doi.org/10.11606/issn.2176-1507.v44fp17-30
Arquivo a: https://doi.org/10.11606/issn.2176-1507.v44fp17-30.g55 
Arquivo b: https://doi.org/10.11606/issn.2176-1507.v44fp17-30.g56 

exemplo: issn.2137-0190.v%vf%ia%a
Artigo: https://doi.org/10.11606/issn.2137-0190.v44f55a5 
Arquivo a: https://doi.org/10.11606/issn.2137-0190.v44f55a5.g55 
Arquivo b: https://doi.org/10.11606/issn.2137-0190.v44f55a5.g56  
