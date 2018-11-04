//
//  ProgramViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import FSCalendar

class ProgramViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, FSCalendarDataSource, FSCalendarDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var dayView: FSCalendar!

    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!


    let timeValues = ["08:30 - 09:30", "10:00", "10:10", "11:30 - 12:30", "13:00 - 13:30", "15:00 - 16:00", "16:00 - 20:00", "20:00 - 21:00","21:00 - 22:00" ]
    let indexes = ["1","2","3","4","5","6","7","8","9"]
    let imageValues = [UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag")]
    let addressNames = ["Mandel Kemping - 8229 Paloznak, Görbe utca 5.", "Mandel Kemping - 8229 Paloznak, Görbe utca 5.", "Guruljon az élet-Csopak, 0219/4, 8229", "8237 Tihany, András tér 1", "Nagyi Kertje Teázó-8241 Aszófő, Remete u. 2", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/1", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/1", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/1", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/15"]
    let descriptionValues = ["Közös reggeli - kontinentális menü", "Az első kilométerek megtétele", "Guruljon az élet", "Feltekerés a Tihanyi apátsághoz, amely a domb tetején található","Nagyi Kertje Teázó","Szállások elfoglalása","Lángos, röpi, vizibicikli, sör, fröccs, stb","Grillezés (csirkemell, kolbászok, zöldségek)","Fergeteges hangulattal és remek társasággal"]
    let titleValues = ["Reggeli", "Indulás Paloznakról", "Sportfröccs", "Tihanyi templomdomb", "Sörözés Aszófőn","Érkezés Zánkára","Strand","Vacsora","Kvízest"]




    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.dayView, action: #selector(self.dayView.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
        }()

    override func viewDidLoad() {

        super.viewDidLoad()

        if UIDevice.current.model.hasPrefix("iPad") {
            self.calendarHeightConstraint.constant = 400
        }

        self.dayView.select(Date())

        self.view.addGestureRecognizer(self.scopeGesture)
        self.collectionView.panGestureRecognizer.require(toFail: self.scopeGesture)
        self.dayView.scope = .week

        // For UITest
        self.dayView.accessibilityIdentifier = "calendar"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ma", style: .done, target: self, action: #selector(addTapped))


    }
    @objc func addTapped(sender: AnyObject) {
        self.dayView.select(Date())
        guard let dateNow = dayView.selectedDate else{
            return
        }
        print("did select date \(dateFormatter.string(from: dateNow))")
    }

    deinit {
        print("\(#function)")
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let shouldBegin = self.collectionView.contentOffset.y <= -self.collectionView.contentInset.top
        if shouldBegin {
            let velocity = self.scopeGesture.velocity(in: self.view)
            switch self.dayView.scope {
            case .month:
                return velocity.y < 0
            case .week:
                return velocity.y > 0
            }
        }
        return shouldBegin
    }

    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.dateFormatter.string(from: date))")
        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected dates is \(selectedDates)")
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("\(self.dateFormatter.string(from: calendar.currentPage))")
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleValues.count
    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "programcell", for: indexPath) as! ProgramCollectionViewCell

        cell.imageURL.image = imageValues[indexPath.row]
        cell.descriptionLabel.text = descriptionValues[indexPath.row]
        cell.titleLabel.text = titleValues[indexPath.row]
        cell.timeLabel.text = timeValues[indexPath.row]

        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath

        return cell
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected cell number: \(indexPath.row)")
    }

}
