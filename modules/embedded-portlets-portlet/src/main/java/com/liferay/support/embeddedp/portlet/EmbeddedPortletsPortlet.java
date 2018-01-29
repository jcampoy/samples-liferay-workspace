package com.liferay.support.embeddedp.portlet;

import com.liferay.support.embeddedp.constants.EmbeddedPortletsPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;


import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author Jose Angel Jimenez
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=false",
		"javax.portlet.display-name=Embedded Portlets",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + EmbeddedPortletsPortletKeys.EmbeddedPortlets,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class EmbeddedPortletsPortlet extends MVCPortlet {
}