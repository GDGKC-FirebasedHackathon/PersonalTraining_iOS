
import UIKit
import QuartzCore
import Firebase
import SwiftyJSON

class GraphVC: UIViewController, LineChartDelegate {
    
    var txtWeight: String?
    var txtDate: String?
    
    var test : String?
    var weightlist = [WeightVO]()
    var label = UILabel()
    
    var xDateLabels = [String]()
    var yWeightLabels = [Float]()
    var dbRef : FIRDatabaseReference!
    
    
    var lineChart : LineChartView!
    
    @IBAction func btnAddWeigth(_ sender: Any) {
    
        let customTransitionDelegate = CustomTrasitionDelegate(height: 420)
        transitioningDelegate = customTransitionDelegate
        let avc = storyboard!.instantiateViewController(withIdentifier: "PopUpWeightVC")
        avc.modalPresentationStyle = .custom
        avc.transitioningDelegate = customTransitionDelegate
        present(avc, animated: true)
        
    }
    
    
    //weightlist에 여러 데이터가 쌓이면, 최신 5개의 데이터만 가져온다.
    //weight와, date에는 최대 5개.
    
    func initXaxis(list: [WeightVO]) {
        for item in list {
            xDateLabels.append(gsno(item.date))
            yWeightLabels.append(item.weight!)
        }
    }
    
    
    func recentWeight(wvo: WeightVO){
 
        xDateLabels.append(wvo.date!)
        yWeightLabels.append(wvo.weight!)
        xDateLabels.remove(at: 0)
        yWeightLabels.remove(at: 0)
        
    }
    
    func initWeight(){
        for i in 1...6{
            weightlist.append(WeightVO.init(weight: 50 , date: "2/17"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initWeight()
        //recentWeight()
        //initChartView()
        loading(.start)
        dbRef = FIRDatabase.database().reference()
        
        _ = dbRef.observe(.value,with: {
            snapshot in
            if let value = snapshot.value {
                let data = JSON(value)
                let array = data["Graph"].arrayValue
                print(array)
                var tempList = [WeightVO]()
                for item in array {
                    let wvo = WeightVO.init(weight: item["weight"].float,
                                            date: item["date"].string)
                        tempList.append(wvo)
                }
                self.weightlist = tempList
                self.initXaxis(list: tempList)
                self.initChartView()
                self.refreshChart()
                self.loading(.end)
            }
            print(self.weightlist)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func toCGFloatListFromWiegtVOList(list: [WeightVO]) -> [CGFloat] {
        var cgFloatList = [CGFloat]()
        for item in list {
            cgFloatList.append(CGFloat(item.weight!))
        }
        return cgFloatList
    }
    
    func initChartView(){
        
        var views: [String: AnyObject] = [:]
        
        label.text = "몸무게를 클릭해보세요!"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        
        // 이쪽 코드분석 좀
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-160-[label]", options: [], metrics: nil, views: views))
        
        
        lineChart = LineChartView()
        lineChart.animation.enabled = true
        lineChart.area = true
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 5
        lineChart.x.labels.values = xDateLabels
        lineChart.y.labels.visible = true
        
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-60-[chart(==200)]", options: [], metrics: nil, views: views))
    }
    
    func refreshChart() {
        lineChart.x.labels.values = xDateLabels
        self.lineChart.clearAll()
        self.lineChart.addLine(self.toCGFloatListFromWiegtVOList(list: weightlist))
    }
    
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        
        label.text = "\(xDateLabels[Int(x)])의 몸무게는 \(yValues)kg 입니다."
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
