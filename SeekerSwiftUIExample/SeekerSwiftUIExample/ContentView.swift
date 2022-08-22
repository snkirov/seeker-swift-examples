//
//  ContentView.swift
//  SeekerSwiftUIExample
//
//  Created by Svilen Kirov on 18.07.22.
//

import SwiftUI
import Seeker
import Tracing
import SwiftPrometheus_Integration

struct ContentView: View {
    @LoggerInstance var logger
    @PromMetricsInstance var metrics
    @TracerInstance var tracer
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Button(action: generateLog) { Text("Generate Log")
                }
                Button(action: generateMetric) { Text("Generate Metric")
                }
                Button(action: generateTrace) { Text("Generate Trace")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("SwiftUI Example")
    }
    
    private func generateLog() {
        logger.log(level: .info, "\(logger.label):Navigated to tuition view from profile screen", metadata: ["label":.string(logger.label)])
        logger.log(level: .info, "\(logger.label):Tuition fee not paid")
    }
    
    private func generateMetric() {
        let counter = metrics.createCounter(forType: Int.self, named: "doodle")
        counter.inc()
    }
    
    private func generateTrace() {
        DispatchQueue.global(qos: .background).async {
            let rootSpan = tracer.startSpan("fetch_tuition_status", baggage: .topLevel)

            sleep(1)
            rootSpan.addEvent(SpanEvent(
                name: "Fetch failed",
                attributes: ["error_code": 402]
            ))
            sleep(1)
//
            let childSpan = tracer.startSpan("fetch_tuition_status_retry", baggage: rootSpan.baggage)
            
            sleep(1)
            sleep(1)
            childSpan.addEvent(SpanEvent(
                name: "Fetch successfull",
                attributes: ["tuition_status": "unpaid", "try_number": 2]
            ))
            sleep(1)
            childSpan.end()

            sleep(1)
            
            rootSpan.end()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
