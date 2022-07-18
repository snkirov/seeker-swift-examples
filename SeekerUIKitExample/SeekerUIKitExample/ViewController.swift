//
//  ViewController.swift
//  SeekerUIKitExample
//
//  Created by Svilen Kirov on 18.07.22.
//

import UIKit
import Seeker
import Tracing

class ViewController: UIViewController {

    @IBOutlet weak var LoggerButton: UIButton!
    @IBOutlet weak var MetricsButton: UIButton!
    @IBOutlet weak var TracerButton: UIButton!
    
    private var logger = Seeker.logger
    private var metrics = Seeker.metrics
    private var tracer = Seeker.tracer
    
    @IBAction func didTapLogger(_ sender: Any) {
        generateLog()
    }
    
    @IBAction func didTapMetrics(_ sender: Any) {
        generateMetric()
    }
    
    @IBAction func didTapTracer(_ sender: Any) {
        generateTrace()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoggerButton.setTitle("Generate Log", for: .normal)
        MetricsButton.setTitle("Generate Metric", for: .normal)
        TracerButton.setTitle("Generate Trace", for: .normal)
        self.title = "UIKit Example"
    }

    private func generateLog() {
        logger.log(level: .info, "Just generated log from main screen.")
    }
    
    private func generateMetric() {
        let counter = metrics.createCounter(forType: Int.self, named: "doodle")
        counter.inc()
    }
    
    private func generateTrace() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            let rootSpan = strongSelf.tracer.startSpan("initial_span", baggage: .topLevel)

            sleep(1)
            rootSpan.addEvent(SpanEvent(
                name: "Discovered the meaning of life",
                attributes: ["meaning_of_life": 42]
            ))

            let childSpan = strongSelf.tracer.startSpan("child_span", baggage: rootSpan.baggage)

            sleep(1)
            childSpan.end()

            sleep(1)
            rootSpan.end()
        }
    }
}

