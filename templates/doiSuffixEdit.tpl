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

{** a referencia de url doi funcionou ------------------------- porém falta ref do identificador e do galley--------- *}

{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}

{if $enableObjectDoi}
	{assign var=storedPubId value=$pubObject->getStoredPubId($pubIdPlugin->getPubIdType())}
	{fbvFormArea id="pubIdDOIFormArea" class="border" title="plugins.pubIds.doi.editor.doi"}
		{assign var=formArea value=true}
		{if $pubIdPlugin->getSetting($currentContext->getId(), 'doiSuffix') == 'customId' || $storedPubId}
			{if empty($storedPubId)} {* edit custom suffix *}
				{fbvFormSection}
    <hr>
    <p class="pkp_help">{translate key="plugins.pubIds.doi.manager.settings.doiSuffix.description"}</p>
    {fbvElement type="hidden" label="plugins.pubIds.doi.manager.settings.doiPrefix" id="doiPrefix" disabled=true value=$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix') size=$fbvStyles.size.SMALL}
    <img src="/plugins/generic/relationalDoi/02.png"></a>
    						
{fbvElement type="text" label="plugins.pubIds.doi.manager.settings.doiSuffix" id="doiSuffix" value="$doiSuffix.g{$fileId|escape}" size=$fbvStyles.size.MEDIUM}
    <hr>
    {fbvElement type="hidden" id="doiRepresentationSuffixPattern" value=$doiRepresentationSuffixPattern label="plugins.pubIds.doi.manager.settings.doiSuffixPattern.representations" maxlength="40" inline=true size=$fbvStyles.size.MEDIUM readonly=true}


			ver se grep -r "representationId" funciona
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		

			
			<br><span class="texto">
  <b>O DOI deste Arquivo será:</b><br>
  <b>{$doiUrl|unescape:"html"}{$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix')}/ do artigo identificador /{$doiSuffix|unescape:"html"}</b>
  
  teste: <br>
			
			
			
			
			
			
			a{$doiPrefix|unescape:"html"}a<br>
			b{$doiSuffix|unescape:"html"}b<br>
			c{$doiUrl|unescape:"html"}c<br>
			d{$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix')}d<br>
			e{$storedPubId|unescape:"html"}e<br>
			f<i>{$pubIdPlugin->getPubId($pubObject)|escape}</i>f<br>
			gu				<p><h3>O DOI deste arquivo é ronaldo: {$pubIdPlugin->getPubId($pubObject)|escape}</h3></p>
g<br>
			hh<br>
							 
  
  
  
  <br>
  
  <b>{$doiSuffix|unescape:"html"}olacolocar o doi do artigo aqui{$doiTableRows|unescape:"html"} ola{$doiUrl|unescape:"html"}{$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix')}{$doiSuffix|unescape:"html"}</b>
</span>
			
			
			
			
				{/fbvFormSection}
				{if $canBeAssigned}
					{assign var=templatePath value=$pubIdPlugin->getTemplateResource('doiAssignCheckBox.tpl')}
					{include file=$templatePath pubId="" pubObjectType=$pubObjectType}
				{else}
				<hr>	estou aqui<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.customSuffixMissing"}</p>
				{/if}
			{else} {* stored pub id and clear option *}
			{fbvFormSection}
			
			
			
			
				<p>
				 <b>O DOI individual deste Arquivo é:</b><br>
  <b>{$doiUrl|unescape:"html"}{$pubIdPlugin->getSetting($currentContext->getId(), 'doiPrefix')}/ do artigo identificador /{$doiSuffix|unescape:"html"}</b>
  <br />
					
					
					
					
					{capture assign=translatedObjectType}{translate key="plugins.pubIds.doi.editor.doiObjectType"|cat:$pubObjectType}{/capture}
					{capture assign=assignedMessage}{translate key="plugins.pubIds.doi.editor.assigned" pubObjectType=$translatedObjectType}{/capture}
					<p class="pkp_help">{$assignedMessage}</p>
					{include file="linkAction/linkAction.tpl" action=$clearPubIdLinkActionDoi contextId="publicIdentifiersForm"}
				{$cuzinho = "aberto"}
				
				
				<p><h3>O DOI deste arquivo é joão: {$pubIdPlugin->getPubId($pubObject)|escape}xiua{$cuzinho|escape}ua</h3></p>
				
			olanovamente
				
				
				
				
				
				
				</p>
				{/fbvFormSection}
			{/if}
		{else} {* pub id preview *} aqui se forma o doi de cada  arquivo
			<p>{$pubIdPlugin->getPubId($pubObject)|escape}</p>
			{if $canBeAssigned}
				<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.canBeAssigned"}</p>
				{assign var=templatePath value=$pubIdPlugin->getTemplateResource('doiAssignCheckBox.tpl')}
				{include file=$templatePath pubId="" pubObjectType=$pubObjectType}
				
				<p>{$pubIdPlugin->getPubId($pubObject)|escape}</p>
			{else}
				<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.patternNotResolved"}</p>
			{/if}
		{/if}
	{/fbvFormArea}
{/if}
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
