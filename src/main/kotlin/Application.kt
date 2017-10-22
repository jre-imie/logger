import com.github.kittinunf.fuel.*
import com.github.kittinunf.result.Result
import mu.KotlinLogging
import spark.Redirect
import spark.Spark.*


private val log = KotlinLogging.logger {}


fun main(args: Array<String>) {

    port(7001)
    get("/hello") { _, res ->
        log.info("hello rest call")
        res.status(200)
        "Hello"

    }

    get("call") { _, _->

        "http://localhost:8080/hello".httpGet().responseString { _, response, _ ->
            log.info (" response !" + response.data + response.statusCode)
            response.responseMessage
        }

    }
}