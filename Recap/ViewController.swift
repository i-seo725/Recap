//
//  ViewController.swift
//  Recap
//
//  Created by 이은서 on 12/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


}


extension UIViewController {
    
    //class func: 타입 메서드
    //class func vs static func
    //static은 상속 받았을 때 오버라이딩 불가
    //class는 상속 받았을 때 오버라이딩 가능
    class func methodSwizzling() {
        
        let origin = #selector(viewWillAppear)
        let change = #selector(changeViewWillAppear)
        
        //앞은 어디서 실행할지, 뒤는 어떤 메서드를 실행할지
        //런타임 시점에 결정돼서 문제 생기면 크리티컬함 확인 필요
        guard let originMethod = class_getInstanceMethod(UIViewController.self, origin),
              let changeMethod = class_getInstanceMethod(UIViewController.self, change)
        else {
            print("함수를 찾을 수 없음")
            return
        }
        
        method_exchangeImplementations(originMethod, changeMethod)  //origin이랑 change를 바꾸겠다
        
    }
    
    @objc func changeViewWillAppear() {
        //파베의 앱 분석 특정 기능 등
        print(#function)
    }
    
}
