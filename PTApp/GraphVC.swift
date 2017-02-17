
import UIKit
import QuartzCore

class GraphVC: UIViewController, LineChartDelegate {
    
    @IBOutlet var testLabel: UILabel!
    var test : String?
    
    var label = UILabel()
    // simple line with custom x axis labels
    let xLabels: [String] = ["", "첫째주", "둘째주", "셋째주", "넷째주", ""]
    
    var lineChart : LineChartView!
    
    @IBAction func btnAddWeigth(_ sender: Any) {
    
        let customTransitionDelegate = CustomTrasitionDelegate(height: 420)
        transitioningDelegate = customTransitionDelegate
        let avc = storyboard!.instantiateViewController(withIdentifier: "PopUpWeightVC")
        avc.modalPresentationStyle = .custom
        avc.transitioningDelegate = customTransitionDelegate
        present(avc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initChartView()
        
        //        var delta: Int64 = 4 * Int64(NSEC_PER_SEC)
        //        var time = dispatch_time(DISPATCH_TIME_NOW, delta)
        //
        //        dispatch_after(time, dispatch_get_main_queue(), {
        //            self.lineChart.clear()
        //            self.lineChart.addLine(data2)
        //        });
        
        //        var scale = LinearScale(domain: [0, 100], range: [0.0, 100.0])
        //        var linear = scale.scale()
        //        var invert = scale.invert()
        //        println(linear(x: 2.5)) // 50
        //        println(invert(x: 50)) // 2.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initChartView(){
        
        var views: [String: AnyObject] = [:]
        
        label.text = "기본 몸무게를 띄워둘까봐"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        
        // 이쪽 코드분석 좀
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        // simple arrays
        let data: [CGFloat] = [15, 40, 30, 58, 40, 20]
        //let data2: [CGFloat] = [1, 3, 5, 13, 17, 20]
        
        
        lineChart = LineChartView()
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 5
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        lineChart.addLine(data)
        //lineChart.addLine(data2)
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
    }
    
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        
        label.text = "\(xLabels[Int(x)])의 몸무게는 \(yValues)kg이지롱"
    }
    
    
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }
    
}
