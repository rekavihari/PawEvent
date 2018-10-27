//
//  ProgramViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    let timeValues = ["08:30 - 09:30", "10:00", "10:10", "11:30 - 12:30", "13:00 - 13:30", "15:00 - 16:00", "16:00 - 20:00", "20:00 - 21:00","21:00 - 22:00" ]
    let indexes = ["1","2","3","4","5","6","7","8","9"]
    let imageValues = [UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag")]
    let addressNames = ["Mandel Kemping - 8229 Paloznak, Görbe utca 5.", "Mandel Kemping - 8229 Paloznak, Görbe utca 5.", "Guruljon az élet-Csopak, 0219/4, 8229", "8237 Tihany, András tér 1", "Nagyi Kertje Teázó-8241 Aszófő, Remete u. 2", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/1", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/1", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/1", "Zánkai Erzsébet-Tábor - 8251 Zánka, Külterület hrsz. 030/15"]
    let descriptionValues = ["Közös reggeli - kontinentális menü", "Az első kilométerek megtétele", "Guruljon az élet", "Feltekerés a Tihanyi apátsághoz, amely a domb tetején található","Nagyi Kertje Teázó","Szállások elfoglalása","Lángos, röpi, vizibicikli, sör, fröccs, stb","Grillezés (csirkemell, kolbászok, zöldségek)","Fergeteges hangulattal és remek társasággal"]
    let titleValues = ["Reggeli", "Indulás Paloznakról", "Sportfröccs", "Tihanyi templomdomb", "Sörözés Aszófőn","Érkezés Zánkára","Strand","Vacsora","Kvízest"]


    override func viewDidLoad() {


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
