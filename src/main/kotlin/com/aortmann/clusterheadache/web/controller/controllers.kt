package com.aortmann.clusterheadache.web.controller

import com.google.api.services.sheets.v4.Sheets
import com.google.api.services.sheets.v4.model.ValueRange
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.servlet.ModelAndView


@Controller
open class IndexController {
    @RequestMapping("/") open fun index(map: ModelMap): ModelAndView {
        val mv = ModelAndView("index")

        mv.addObject("message", "asd")
        return mv
    }
}

@RestController
open class AddController @Autowired constructor(private val sheetsService: Sheets) {
    @RequestMapping("/add", method = arrayOf(RequestMethod.POST)) open fun index(@RequestBody data: List<String>): String {
        val spreadsheetId = "1c1Y3z1PNcF6vtrresU2co9djEsjjcfBS4ygIVtUfhG4"

        val lastRow = sheetsService.spreadsheets().values().get(spreadsheetId, "Sheet1!A:A").execute().getValues().size
        val writeRange = "Sheet1!A${lastRow + 1}"

        val writeData: List<List<Any>> = mutableListOf(data)

        val vr = ValueRange().setValues(writeData).setMajorDimension("ROWS")
        sheetsService.spreadsheets().values()
                .update(spreadsheetId, writeRange, vr)
                .setValueInputOption("RAW")
                .execute()

        return "true"
    }
}