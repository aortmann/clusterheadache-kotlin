package com.aortmann.clusterheadache.web.controller

import com.google.api.services.sheets.v4.Sheets
import com.google.api.services.sheets.v4.model.ValueRange
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.servlet.ModelAndView
import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.*


@Controller
open class IndexController {
    @RequestMapping("/") open fun index(): ModelAndView {
        val mv = ModelAndView("index")
        return mv
    }
}

@RestController
open class AddController @Autowired constructor(private val sheetsService: Sheets) {
    @RequestMapping("/add", method = arrayOf(RequestMethod.POST)) open fun index(@RequestBody data: List<String>): String {
        val spreadsheetId = "1c1Y3z1PNcF6vtrresU2co9djEsjjcfBS4ygIVtUfhG4"

        val lastRow = sheetsService.spreadsheets().values().get(spreadsheetId, "Datos!A:A").execute().getValues().size
        val writeRange = "Datos!A${lastRow + 1}"

        val writeData: List<List<Any>> = mutableListOf(data)

        val vr = ValueRange().setValues(writeData).setMajorDimension("ROWS")
        sheetsService.spreadsheets().values()
                .update(spreadsheetId, writeRange, vr)
                .setValueInputOption("RAW")
                .execute()

        return "true"
    }
}

@RestController
open class HistoryController @Autowired constructor(private val sheetsService: Sheets) {
    @RequestMapping("/history", method = arrayOf(RequestMethod.GET)) open fun history(): List<RecordData> {
        val spreadsheetId = "1c1Y3z1PNcF6vtrresU2co9djEsjjcfBS4ygIVtUfhG4"

        val data = sheetsService.spreadsheets().values().get(spreadsheetId, "Datos!A3:Z").execute().getValues()
        val transformedData = ArrayList<RecordData>()
        val dateTimeFormat = SimpleDateFormat("d/MM/yyyy HH:mm")
        val timeFormat = SimpleDateFormat("HH:mm")

        data.forEachIndexed { i, r ->
            val duration = {
                try {
                    timeFormat.parse(r[5].toString())
                } catch(e: ParseException) {
                    null
                }
            }.invoke()
            transformedData.add(RecordData("Datos!A${3 + i}", dateTimeFormat.parse("${r[0]} ${r[1]}"), timeFormat.parse("${r[1]}"), r[2].toString(), r[3].toString(), r[4].toString().split(","), duration, Integer.valueOf(r[6].toString())))
        }
        return transformedData.reversed()
    }
}

@RestController
open class SaveController @Autowired constructor(private val sheetsService: Sheets) {
    @RequestMapping("/save", method = arrayOf(RequestMethod.POST)) open fun index(@RequestBody data: SaveRequiredData): String {
        val spreadsheetId = "1c1Y3z1PNcF6vtrresU2co9djEsjjcfBS4ygIVtUfhG4"

        val writeData: List<List<Any>> = mutableListOf(listOf(data.time))

        val endTimeCell = data.cell.replace("![A-Z]".toRegex(), "!F")

        val vr = ValueRange().setRange(endTimeCell).setValues(writeData).setMajorDimension("ROWS")
        sheetsService.spreadsheets().values()
                .update(spreadsheetId, endTimeCell, vr)
                .setValueInputOption("RAW")
                .execute()

        return "true"
    }
}

data class RecordData(val cell: String, val dateTime: Date, val time: Date, val description: String, val where: String, val medications: List<String>, val duration:Date?, val painLevel: Int)
data class SaveRequiredData(val cell: String, var time: String)