package com.aortmann.clusterheadache.web.configuration

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext

inline fun <reified T : Any> AnnotationConfigWebApplicationContext.register() = this.register(T::class.java)