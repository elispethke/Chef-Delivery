//
//  EditAddressViewModel.swift
//  Delivery
//
//  Created by Elis Pethke on 15/05/25.
//

import Foundation
import MapKit


final class EditAddressViewModel: ObservableObject {
    
    @Published var addressText: String
    @Published var region: MKCoordinateRegion
    
    init(currentAddress: String) {
            self.addressText = currentAddress
            self.region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        }
    
    func saveAddress() {
        UserDefaults.standard.set(addressText, forKey: "saveAddress")
    }
}
