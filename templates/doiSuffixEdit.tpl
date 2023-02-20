{**
 * @file plugins/pubIds/doi/templates/doiSuffixEdit.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Edit custom DOI suffix for an object (issue, submission, galley)
 *}

{assign var=pubObjectType value=$pubIdPlugin->getPubObjectType($pubObject)}
{** aqui permite que se mostre o doi de aruivo*}
{assign var=enableObjectDoi value=$pubIdPlugin->getSetting($currentContext->getId(), "enable`$pubObjectType`Doi")}


{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}

{if $enableObjectDoi}
	{assign var=storedPubId value=$pubObject->getStoredPubId($pubIdPlugin->getPubIdType())}
	{fbvFormArea id="pubIdDOIFormArea" class="border" title="plugins.pubIds.doi.editor.doi"}
		{assign var=formArea value=true}
		{if $pubIdPlugin->getSetting($currentContext->getId(), 'doiSuffix') == 'customId' || $storedPubId}
			{if empty($storedPubId)} {* edit custom suffix *}
				{fbvFormSection}
{** inicio DOI manual para cada arquivo **}
	   
    <p class="pkp_help">{translate key="plugins.pubIds.doi.manager.settings.doiSuffix.description"}</p>
    {fbvElement type="hidden" label="plugins.pubIds.doi.manager.settings.doiPrefix" id="doiPrefix" disabled=true value=$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix') size=$fbvStyles.size.SMALL}
    <img src="/plugins/generic/relationalDoi/02.png"></a>
    						
{fbvElement type="text" label="plugins.pubIds.doi.manager.settings.doiSuffix" id="doiSuffix" value="$doiSuffix.g{$fileId|escape}" size=$fbvStyles.size.MEDIUM}
    
    {fbvElement type="hidden" id="doiRepresentationSuffixPattern" value=$doiRepresentationSuffixPattern label="plugins.pubIds.doi.manager.settings.doiSuffixPattern.representations" maxlength="40" inline=true size=$fbvStyles.size.MEDIUM readonly=true}


			ver se grep -r "representationId" funciona
			
			
			
		<br><span class="texto">
  <b>O DOI deste Arquivo aqui será:</b><br>
  <b>{$doiUrl|unescape:"html"}{$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix')}/{$doiSuffix|unescape:"html"}(deveria ter o identificador aqui)</b>
 		
				{/fbvFormSection}
				
				{if $canBeAssigned}
					{assign var=templatePath value=$pubIdPlugin->getTemplateResource('doiAssignCheckBox.tpl')}
					{include file=$templatePath pubId="" pubObjectType=$pubObjectType}
				{else}
				
				
{**  FIM DOI manual para cada arquivo **}
				
{** Inicio demonstração do DOI manual para cada arquivo **}
				
				
				<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.customSuffixMissing"}</p>
				{/if}
			{else} {* stored pub id and clear option *}
			{fbvFormSection}
			
				
				 <b>O DOI deste Arquivo aqui é:</b><br>
  <b>{$doiUrl|unescape:"html"}{$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix')}/{$doiSuffix|unescape:"html"}(deveria ter o identificador aqui)</b>
 					
					{capture assign=translatedObjectType}{translate key="plugins.pubIds.doi.editor.doiObjectType"|cat:$pubObjectType}{/capture}
					{capture assign=assignedMessage}{translate key="plugins.pubIds.doi.editor.assigned" pubObjectType=$translatedObjectType}{/capture}
					<p class="pkp_help">{$assignedMessage}</p>
					{include file="linkAction/linkAction.tpl" action=$clearPubIdLinkActionDoi contextId="publicIdentifiersForm"}
				{/fbvFormSection}

{** FIM demonstração do DOI manual para cada arquivo **}

{** inicio mostra o doi dos arquivos que tem composição automática e/ou o doi de artigo é feito manualmente nas configurações de DOI **}

			{/if}
		{else} {* pub id preview *}
			<p><b>O DOI deste arquivo é: {$pubIdPlugin->getPubId($pubObject)|escape}</b></p>
			{if $canBeAssigned}
				<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.canBeAssigned"}</p>
				{assign var=templatePath value=$pubIdPlugin->getTemplateResource('doiAssignCheckBox.tpl')}
				{include file=$templatePath pubId="" pubObjectType=$pubObjectType}
				
			{else}
				<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.patternNotResolved"}</p>
			{/if}
		{/if}
	{/fbvFormArea}
{/if}

{** FIM mostra o doi dos arquivos que tem composição automática e/ou o doi de artigo é feito manualmente nas configurações de DOI **}


{* issue pub object *}
{if $pubObjectType == 'Issue'}
	{assign var=enablePublicationDoi value=$pubIdPlugin->getSetting($currentContext->getId(), "enablePublicationDoi")}
	{assign var=enableRepresentationDoi value=$pubIdPlugin->getSetting($currentContext->getId(), "enableRepresentationDoi")}
	{if $enablePublicationDoi || $enableRepresentationDoi}
		{if !$formArea}
			{assign var="formAreaTitle" value="plugins.pubIds.doi.editor.doi"}
		{else}
			{assign var="formAreaTitle" value=""}
		{/if}
		{fbvFormArea id="pubIdDOIFormArea" class="border" title=$formAreaTitle}
			{fbvFormSection list="true" description="plugins.pubIds.doi.editor.clearIssueObjectsDoi.description"}
				{include file="linkAction/linkAction.tpl" action=$clearIssueObjectsPubIdsLinkActionDoi contextId="publicIdentifiersForm"}
			{/fbvFormSection}
		{/fbvFormArea}
	{/if}
{/if}
