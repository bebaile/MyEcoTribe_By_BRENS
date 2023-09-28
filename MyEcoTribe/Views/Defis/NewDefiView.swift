//
//  AddEventView.swift
//  MyEcoTribe
//
//  Created by Basile Carle on 26/09/2023.
//

import SwiftUI
import PhotosUI

struct NewDefiView: View {
    
    @State  private var defiDate: Date = Date()
    @State  private var defiTitle: String = ""
    @State  private var defiDescription: String = ""
    @State  private var hoursDuration: Int = 0
    @State  private var minutesDuration: Int = 0
    @State private var defiLocation: String = ""
    @State private var defiType: String = ""
    @State private var defiPhotoItem: PhotosPickerItem?
    @State private var defiImage: Image?
    @State private var coordinates = CLLocationCoordinate2D(latitude: 37.333747, longitude: -122.011448)
    @State private var showSheet = false
    @State private var isMapVisible = false
    @State private var selectedLocation: CLLocationCoordinate2D?
    @State var isOn : Bool = false
    @State var selectMembers: [String] = ["Basile", "Emilien", "Nicolas", "Sylvain", "Renaud"]
    @State var isInvited: Bool = false
    @State private var selectedMembers: [String] = []
    @State var utilisateurPhoto: String = "renaud"

    @EnvironmentObject var defiFeed: DefiFeed
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            //            Form {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Annuler")
                })
                Spacer()
            }.padding()
            
            ScrollView {
                ZStack {
                    BigCard()
                    VStack(alignment: .leading) {
                        Section(header: Text("Ajouter un défi").font(.title3).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)) {
                            HStack {
                                Image(systemName: "calendar")
                                DatePicker("Date :", selection: $defiDate, displayedComponents: [.date])
                            }
                            Divider()
                            HStack {
                                Image(systemName: "watch.analog")
                                DatePicker("Heure :", selection: $defiDate, displayedComponents: [.hourAndMinute])
                            }
                            Divider()
                            HStack {
                                
                                Image(systemName: "clock.arrow.2.circlepath")
                                HStack (spacing: 0){
                                    Text("Durée :")
                                    Spacer()
                                    HStack (spacing: 0) {
                                        Picker("", selection: $hoursDuration) {
                                            ForEach(0...24, id: \.self) { i in
                                                Text("\(i) h").tag(i)
                                            }
                                        }.pickerStyle(.automatic)
                                        Picker("", selection: $minutesDuration) {
                                            ForEach(0...60, id: \.self) { i in
                                                Text("\(i) min").tag(i)
                                            }
                                        }.pickerStyle(.automatic)
                                        
                                    }.frame(width: 180)
                                }
                            }
                            Divider()
                            HStack {
                                Text("Titre : ")
                                TextField("Comment ça s'appelle ?", text: $defiTitle)
                            }
                            Divider()
                            HStack {
                                Text("Type : ")
                                TextField("C'est quoi ?", text: $defiType)
                            }
                            Divider()
                            VStack(alignment: .leading) {
                                Text("Description : ")
                                TextEditor(text: $defiDescription).frame(minHeight: 96).clipShape(RoundedRectangle(cornerRadius: 15))
                            }.padding(.horizontal, 5)
                            
                            Divider()
                            // photo picker
                            HStack (spacing: 15){
                                Image(systemName: "person")
                                Text ("Inviter")
                                    .foregroundColor(Color.gray)
                                Spacer()
                                Button(action: {
                                    isInvited.toggle()
                                }) {
                                    Text(isInvited ? "-" : "+").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                }
                                
                            }
                            .padding(.leading, 20)
                            if isInvited {
                                ZStack {
                                    
                                    appColorsLightGreen
                                    
                                    List {
                                        ForEach(selectMembers, id: \.self) { member in
                                            Toggle(
                                                member,
                                                isOn: Binding(
                                                    get: { selectedMembers.contains(member) },
                                                    set: { isSelected in
                                                        if isSelected {
                                                            selectedMembers.append(member)
                                                        } else {
                                                            selectedMembers.removeAll { $0 == member }
                                                        }
                                                    }
                                                )
                                            ).listRowBackground(appColorsLightGreen)
                                        }
                                    }.listStyle(PlainListStyle()) 
                                    .frame(width: 200, height: 250)
                                }
                            }
                            HStack {
                                Image(systemName: "camera")
                                Text ("Photo")
                                    .foregroundColor(.gray)
                                Spacer()
                                PhotosPicker("+", selection: $defiPhotoItem, matching: .images)
                                
                                if let defiImage {
                                    defiImage.resizable().scaledToFill().frame(width: 75, height: 75).clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }.onChange(of: defiPhotoItem) { _ in
                                Task {
                                    if let data = try? await defiPhotoItem?.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            defiImage = Image(uiImage: uiImage)
                                            return
                                        }
                                    }
                                    print("failed")
                                }
                            }.padding(.leading, 20)
                            
                            HStack(spacing: 15) {
                                Image(systemName: "mappin.and.ellipse")
                                TextField("Lieux", text: $defiLocation)
                                    //.foregroundColor(.gray)
                                Button(action: {
                                    isMapVisible.toggle()
                                }) {
                                    Text(isMapVisible ? "-" : "+").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    
                                }
                            }.padding(.leading, 20)
                            
                            if isMapVisible {
                                MapSelectedView(selectedLocation: $selectedLocation, cityName: $defiLocation)
                                    .frame(width: 280, height: 280)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            
                            Button(action: {
                                saveDefi(defiDate: defiDate, defiTitle: defiTitle, defiDescription: defiDescription, hoursDuration: hoursDuration, minutesDuration: minutesDuration, defiLocation: defiLocation,defiType: defiType,  defiImage: defiImage, members: selectedMembers, utilisateurPhoto: users[1].profilePhoto)
                                dismiss()
                                
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20).fill(Color(red: 0.28, green: 0.735, blue: 0.112)).frame(height: 48)
                                    Text("Ajouter le défi").foregroundColor(.white).padding(.vertical, 10)
                                }
                            })
                            
                            
                            //                        CreateButton(
                            //                            title: "Enregistrer l'évènement",
                            //                            destination: EventDetailCard(isJoined: true, isDisplayed: false, eventName: eventTitle, eventDescription: eventDescription, eventLocalisation: eventLocation, eventDeadline: eventDate, members: [""], organizer: "renaud", locationDistance: 560))
                            
                        }.padding(.top, 5)
                    }.padding(50)
                }
            }
        }.clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        
        
        
        
        
        //        }.padding(20)
    }
    func saveDefi (defiDate: Date, defiTitle: String, defiDescription: String, hoursDuration: Int, minutesDuration: Int, defiLocation: String,defiType: String,  defiImage: Image?, members: [String], utilisateurPhoto: String) {
           let formatter = DateFormatter()
                   formatter.dateStyle = .short
                   let deadline = formatter.string(from: defiDate)
           let defiPost  =
           [DefiData(title: defiTitle, type: defiType, description: defiDescription, place: defiLocation, duration: String ("\(hoursDuration)h \(minutesDuration)min"), deadline: deadline, image: defiImage!, members: members, numberOfMembers: members.count, utilisateurPhoto: utilisateurPhoto)]
           defiFeed.defiFeed.insert(contentsOf: defiPost, at: 0)
       }
    
}

#Preview {
    NewDefiView()
}
