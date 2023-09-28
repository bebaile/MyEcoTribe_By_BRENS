//
//  AddEventView.swift
//  MyEcoTribe
//
//  Created by Basile Carle on 26/09/2023.
//

import SwiftUI
import PhotosUI

struct NewEventView: View {
    
    @EnvironmentObject var liveEvent: LiveEvent
    @Environment(\.dismiss) var dismiss
    
    @State  private var eventDate: Date = Date()
    @State  private var eventTitle: String = ""
    @State  private var eventDescription: String = ""
    @State  private var hoursDuration: Int = 0
    @State  private var minutesDuration: Int = 0
    @State private var eventLocation: String = ""
    @State private var isInvited: Bool = false
    
    @State private var eventPhotoItem: PhotosPickerItem?
    @State private var eventImage: Image?
    
    @State var selectMembers: [String] = ["Basile", "Emilien", "Nicolas", "Sylvain", "Renaud"]
    @State private var selectedMembers: [String] = []
    
    @State private var isMapVisible = false
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Annuler")
                })
                Spacer()
            }.padding()
            //            Form {
            
            ScrollView {
                ZStack {
                    BigCard()
                    
                    
                    VStack(alignment: .leading) {
                        Section(header: Text("Ajouter un évènement").font(.title3).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)) {
                            HStack {
                                Image(systemName: "calendar")
                                DatePicker("Date :", selection: $eventDate, displayedComponents: [.date])
                            }
                            Divider()
                            HStack {
                                Image(systemName: "watch.analog")
                                DatePicker("Heure :", selection: $eventDate, displayedComponents: [.hourAndMinute])
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
                                TextField("Comment ça s'appelle ?", text: $eventTitle)
                            }
                            Divider()
                            VStack(alignment: .leading) {
                                Text("Description : ")
                                TextEditor(text: $eventDescription).frame(minHeight: 96).clipShape(RoundedRectangle(cornerRadius: 15))
                            }.padding(.horizontal, 5)
                            
                            Divider()
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
                                
                            }.padding(.leading, 20)
                            if isInvited {
                                VStack(alignment: .center) {
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
                                        )
                                        Divider()
                                    }
                                    
                                }
                                .frame(width: 300)
                            }
                            
                            // photo picker
                            HStack {
                                Image(systemName: "camera")
                                Text("Photo")
                                    .foregroundColor(.gray)
                                Spacer()
                                PhotosPicker("+", selection: $eventPhotoItem, matching: .images)
                                
                                if let eventImage {
                                    eventImage.resizable().scaledToFill().frame(width: 75, height: 75).clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }.onChange(of: eventPhotoItem) { _ in
                                Task {
                                    if let data = try? await eventPhotoItem?.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            eventImage = Image(uiImage: uiImage)
                                            return
                                        }
                                    }
                                    print("failed")
                                }
                            }.padding(.leading, 20)
                            
                            HStack(spacing: 15) {
                                Image(systemName: "mappin.and.ellipse")
                                TextField("Lieux", text: $eventLocation)
                                Button(action: {
                                    isMapVisible.toggle()
                                }) {
                                    Text(isMapVisible ? "-" : "+").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    
                                }
                            }.padding(.leading, 20)
                            
                            if isMapVisible {
                                MapSelectedView(selectedLocation: $selectedLocation, cityName: $eventLocation)
                                    .frame(width: 280, height: 280)
                                    
                            }
                            Button(action: {
                                saveEvent(eventDate: eventDate, eventTitle: eventTitle, eventDescription: eventDescription, hoursDuration: hoursDuration, minutesDuration: minutesDuration, eventLocation: eventLocation, eventImage: eventImage)
                                dismiss()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20).fill(Color(red: 0.28, green: 0.735, blue: 0.112)).frame(height: 48)
                                    Text("Ajouter l'évènement").foregroundColor(.white).padding(.vertical, 10)
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
    
    func saveEvent(eventDate: Date, eventTitle: String, eventDescription: String, hoursDuration: Int, minutesDuration: Int, eventLocation: String, eventImage: Image?) {
            
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            let deadline = formatter.string(from: eventDate)
            
            let newEvent = [
                EventData(name: eventTitle, description: eventDescription, members: ["basile"], numberOfMembers: 1, duration: String ("\(hoursDuration)h \(minutesDuration)min"), deadline: deadline, localisation: eventLocation, userPhoto: "basile")
            ]
            
            
            
            liveEvent.liveEvent.insert(contentsOf: newEvent, at: 0 )
        }
    
}

#Preview {
    NewEventView()
}

struct FormLine: View {
    var title: String
    var imageName: String?
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                if imageName != nil {
                    Image(systemName: imageName!)
                }
                Text("\(title)")
            }
            
        }
    }
}
