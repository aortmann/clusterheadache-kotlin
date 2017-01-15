package com.aortmann.clusterheadache.web.configuration

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport
import com.google.api.client.json.jackson2.JacksonFactory
import com.google.api.services.sheets.v4.Sheets
import com.google.api.services.sheets.v4.SheetsScopes
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver
import java.io.File
import java.io.IOException
import java.net.URISyntaxException
import java.security.GeneralSecurityException


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

    @Throws(GeneralSecurityException::class, IOException::class, URISyntaxException::class)
    open fun googleCredentials(): GoogleCredential {
        val JSON_FACTORY = JacksonFactory.getDefaultInstance()
        val httpTransport = GoogleNetHttpTransport
                .newTrustedTransport()

        val fileUrl = this.javaClass.getResource("/client-secret.p12")
        val credential = GoogleCredential.Builder()
                .setTransport(httpTransport)
                .setJsonFactory(JSON_FACTORY)
                .setServiceAccountId("kotlin@neon-feat-152119.iam.gserviceaccount.com")
                .setServiceAccountPrivateKeyFromP12File(
                        File(fileUrl.toURI()))
                .setServiceAccountScopes(arrayListOf(SheetsScopes.SPREADSHEETS)).build()

        return credential
    }

    @Bean open fun sheetsService(): Sheets = Sheets.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), googleCredentials()).setApplicationName("neon-feat-152119")
            .build()
}