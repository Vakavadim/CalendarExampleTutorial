//
//  ViewController.swift
//  CalendarExampleTutorial
//
//  Created by Вадим Гамзаев on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let calendarHelper = CalendarHelper()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    // Сегодняшняя дата
    var selectedDate = Date()
    // Количество ячеек
    var totalSquares = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
        // Do any additional setup after loading the view.
    }
    
    // Настройка размеров CollectionView Items с исползованием компановки UICollectionViewFlowLayout
    
    private func setCellsView() {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    private func setMonthView() {
        totalSquares.removeAll()
        
        let daysInMonth = calendarHelper.daysInMonth(date: selectedDate)
        let firstDayOfMonth = calendarHelper.firstOfMonth(date: selectedDate)
        var startingSpace = calendarHelper.weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while(count <= 42) {
            if startingSpace + count == 0 {
                totalSquares.append("")
                totalSquares.append("")
                totalSquares.append("")
                totalSquares.append("")
                totalSquares.append("")
                totalSquares.append("")
                startingSpace += 1
                print("добавляем 6 пропусков")
            } else if (count <= startingSpace || count - startingSpace > daysInMonth) {
                totalSquares.append("")
                print(" count: \(count) - startingSpace: \(startingSpace) добавляем: пропуск")
            } else {
                totalSquares.append(String(count - startingSpace))
                print(" count: \(count) - startingSpace: \(startingSpace) добавляем: \(String(count - startingSpace))")
            }
            count += 1
        }
        
        monthLabel.text = calendarHelper.monthString(date: selectedDate) + " " + calendarHelper.yearString(date: selectedDate)
        collectionView.reloadData()
    }
    
    
    @IBAction func previousMonth(_ sender: Any) {
        
        selectedDate = calendarHelper.minusMonth(date: selectedDate)
        setMonthView()
    }
    @IBAction func nextMonth(_ sender: Any) {
        
        selectedDate = calendarHelper.plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}


// Методы Collection View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarCell
        cell.setCell(text: totalSquares[indexPath.item])
        return cell
    }
    
}

