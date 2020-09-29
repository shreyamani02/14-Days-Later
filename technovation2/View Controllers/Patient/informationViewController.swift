//
//  informationViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 5/1/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class informationViewController: UIViewController, UIScrollViewDelegate {
    
    var slides: [String] = ["image1-2.png", "image0.png","image2.png"]
    var frame = CGRect.zero

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            let image = UIImage(named: "image1-2.png")
            let imageView = UIImageView(image:image!)
            
            let image2 = UIImage(named: "image0.png")
            let imageView2 = UIImageView(image:image2!)
            
            let image3 = UIImage(named: "image2.png")
                   let imageView3 = UIImageView(image:image3!)
            
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            //view.addSubview(imageView)
            imageView2.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            //view.addSubview(imageView2)
            imageView3.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            
            
            pageControl.numberOfPages = slides.count
            setUpScreens()
            scrollView.delegate = self
            
            //var firstNames = [String]()
            // Do any additional setup after loading the view.
            
                   }
        
        func setUpScreens(){
            for index in 0..<slides.count{
                frame.origin.x = scrollView.frame.size.width*CGFloat(index)
                frame.size = scrollView.frame.size
                let imgView = UIImageView(frame: frame)
                imgView.image = UIImage(named:slides[index])
                self.scrollView.addSubview(imgView)
            }
            scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(slides.count)), height: scrollView.frame.size.height)
            scrollView.delegate = self
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            pageControl.currentPage = Int(pageNumber)
        }

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }

