package com.aortmann.clusterheadache.web.controller

import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.servlet.ModelAndView


@RestController
open class RootController constructor() {
    @RequestMapping("/") open fun index(map: ModelMap): ModelAndView {
        val mv = ModelAndView("home")
        mv.addObject("message", "test")
        return mv
    }
}