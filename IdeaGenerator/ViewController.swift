//
//  ViewController.swift
//  IdeaGenerator
//
//  Created by Ryan Nguyen on 10/23/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ideas = ["Make School", "Uber", "Netflix", "Facebook", "Google", "Kickstarter", "Spotify", "Airbnb", "Snapchat", "YouTube", "Dropbox", "Amazon", "Craigslist", "Tinder", "Instagram", "Tesla", "Twitter", "SpaceX"]
    
    let platforms = ["Dogs", "Books", "Gamers", "Star Wars", "Bitcoin", "Goats", "Zombies", "Rich People", "Swimmers", "Florida", "Vampires", "Dragons", "Internet of Things", "Mars", "Cryptocurrency", "Mosquito Repellent", "Fidget Spinners", "Sun Screen", "Water Bottles", "Lost Travelers", "Superheroes"]
    

    @IBOutlet weak var ideaLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var shakeButton: UIButton!
    @IBOutlet weak var forLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func generateIdeasAndPlatforms() {
        let maxIndex = UInt32(ideas.count)
        let randomIndex = Int(arc4random_uniform(maxIndex))
        ideaLabel.text = ideas[randomIndex]
        platformLabel.text = platforms[randomIndex]
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    

    @IBAction func shakeButtonTapped(_ sender: Any) {
        generateIdeasAndPlatforms()
        self.view.backgroundColor = generateRandomColor()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateIdeasAndPlatforms()
        self.view.backgroundColor = generateRandomColor()
    }
    
}

