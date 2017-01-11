package com.aortmann.clusterheadache.web.configuration

import org.springframework.web.WebApplicationInitializer
import org.springframework.web.context.ContextLoaderListener
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext
import org.springframework.web.servlet.DispatcherServlet
import javax.servlet.ServletContext

class bootstrap : WebApplicationInitializer {
    override fun onStartup(ctx: ServletContext) {
        //AppConfig
        val appCtx = AnnotationConfigWebApplicationContext()
        appCtx.register<AppConfig>()
        ctx.addListener(ContextLoaderListener(appCtx))

        //WebConfig
        val webCtx = AnnotationConfigWebApplicationContext()
        webCtx.register<WebConfig>()
        val dispatcher = ctx.addServlet("dispatcher", DispatcherServlet(webCtx))
        dispatcher.setLoadOnStartup(1)
        dispatcher.addMapping("/")
    }
}
