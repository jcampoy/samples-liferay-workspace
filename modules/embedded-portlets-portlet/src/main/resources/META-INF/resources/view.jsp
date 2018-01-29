<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="embedded-portlets-portlet.caption"/></b>
</p>

<hr/>

<div id="announcements1">
	<p>
		com.liferay.portlet.preferences-company-wide=true,<br/>
		com.liferay.portlet.preferences-owned-by-group=true
		<br/>
		<%
		Map<String, Object> annPrefs = new HashMap<String, Object>();
		annPrefs.put("pageDelta", "5");
		%>

		<liferay-portlet:runtime
			defaultPreferences="<%=getPreferences(annPrefs)%>"
			portletName="com_liferay_announcements_web_portlet_AnnouncementsPortlet"
		/>
	</p>
</div>

<hr/>

<div id="languageSelector1">		
	<p>com.liferay.portlet.preferences-owned-by-group=true,<br/>
	   settingsScope=company<br/>
		<%
		Map<String, Object> langPrefs = new HashMap<String, Object>();
		langPrefs.put("languageIds", "es_ES,en_US,hu_HU");
		%>

		<liferay-portlet:runtime
			defaultPreferences="<%=getPreferences(langPrefs)%>"
			portletName="com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet"
			settingsScope="company"
		/>
	</p>
</div>

<hr/>

<div id="assetList1"> 
	<p>com.liferay.portlet.instanceable=true,<br/>
	   com.liferay.portlet.preferences-owned-by-group=true<br/>

		<%
		Map<String, Object> apPrefs = new HashMap<String, Object>();
		apPrefs.put("socialBookmarksDisplayStyle", "horizontal");
		apPrefs.put("socialBookmarksTypes", "twitter,linkedin");
		%>
	
		<liferay-portlet:runtime
			defaultPreferences="<%=getPreferences(apPrefs)%>"
			portletName="com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet"
			instanceId="emb1"
		/>
	</p>
</div>

<hr/>

<div id="assetList2">
	
	<p>com.liferay.portlet.instanceable=true,<br/>
	   com.liferay.portlet.preferences-owned-by-group=true,<br/>
	   settingsScope=company<br/>

		<%
		Map<String, Object> apPrefs2 = new HashMap<String, Object>();
		apPrefs2.put("socialBookmarksDisplayStyle", "menu");
		apPrefs2.put("socialBookmarksTypes", "twitter,facebook,linkedin");
		%>
	
		<liferay-portlet:runtime
			defaultPreferences="<%=getPreferences(apPrefs2)%>"
			portletName="com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet"
			instanceId="emb2"
			settingsScope="company"
		/>
	</p>
</div>

<%!
public String getPreferences(Map<String, Object> preferences) {

	StringBundler sb = new StringBundler();

	sb.append("<portlet-preferences>");

	for (Map.Entry<String, Object> entry : preferences.entrySet()) {
		sb.append("<preference><name>");
		sb.append(entry.getKey());
		sb.append("</name>");

		Object valueObject = entry.getValue();

		if (valueObject instanceof String) {
			sb.append("<value>");
			sb.append(valueObject);
			sb.append("</value>");
		}
		else if (valueObject instanceof String[]) {
			for (String value : (String[])valueObject) {
				sb.append("<value>");
				sb.append(valueObject);
				sb.append("</value>");
			}
		}
		else {
			sb.setIndex(sb.index() - 3);
			continue;
		}
		sb.append("</preference>");
	}

	sb.append("</portlet-preferences>");

	return sb.toString();
}
%>