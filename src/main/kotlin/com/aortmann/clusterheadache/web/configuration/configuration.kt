package com.aortmann.clusterheadache.web.configuration

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver


@Configuration
open class AppConfig

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = arrayOf("com.aortmann.clusterheadache.web.controller"))
open class WebConfig : WebMvcConfigurerAdapter() {
    override fun addResourceHandlers(registry: ResourceHandlerRegistry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/")
    }

    @Bean open fun freemarkerConfig(): FreeMarkerConfigurer {
        val config = FreeMarkerConfigurer()
        config.setTemplateLoaderPath("/resources/")
        return config
    }

    @Bean open fun freemarkerViewResolver(): FreeMarkerViewResolver {
        return FreeMarkerViewResolver("/ftl/", ".ftl")
    }
}