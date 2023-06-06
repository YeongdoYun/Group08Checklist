import SwiftUI

struct ChecklistView: View {
    @State private var selectedItems: [String] = []
    
    
    var openWeatherResponse: OpenWeatherResponse
    var isAAASelected: Bool
    var isBBBSelected: Bool
    var isCCCSelected: Bool
    var isDDDSelected: Bool
    var isEEESelected: Bool
    
    var isRRRSelected: Bool
    var isVVVSelected: Bool
    var isFFFSelected: Bool
    var isOOOSelected: Bool
    
    private var noweather: Bool {
        if Weather(response: openWeatherResponse).tempt > 30 {
            return false
        }
        if Weather(response: openWeatherResponse).tempt < 0 {
            return false
        }
        if Weather(response: openWeatherResponse).main == "Rain" {
            return false
        }
        return true
    }
    
    private var nowork: Bool {
        if isAAASelected { return false }
        if isBBBSelected { return false }
        if isCCCSelected { return false }
        if isDDDSelected { return false }
        if isEEESelected { return false }
        
        return true
    }
    
    private var noequip: Bool {
        if isRRRSelected { return false }
        if isVVVSelected { return false }
        if isFFFSelected { return false }
        if isOOOSelected { return false }
        
        return true
    }
    
    
    var uncheckedItems: [String] {
        var uncheckedItems: [String] = []
        
        if Weather(response: openWeatherResponse).tempt > 30 {
            uncheckedItems += ["15 minutes or more break every hour", "In indoor workplaces, keep windows and doors open for natural ventilation and refrain from working in confined spaces", "Refrain from working outdoors between 2:00 PM and 5:00 PM", "Drink cool water or saline every 30 minutes while working (no caffeinated drinks)", "Even if it is hot, be careful not to be negligent in wearing protective equipment such as hard hats and safety belts", "Check workers who are vulnerable to heat illness in advance and prepare and check emergency contact networks"]
        }
        if Weather(response: openWeatherResponse).tempt < 0 {
            uncheckedItems += ["Installation of facilities to provide hot water (including drinking water) to maintain body temperature", "A separate resting place is provided for resting while maintaining body temperature during resting hours", "Provision of protective equipment suitable for workers handling low-temperature objects such as winter helmets, winter shoes, and winter gloves", "Preparation for fire hazards caused by overheating of heating appliances", "Preparation of equipment and special tools for snow removal work"]
        }
        
        if Weather(response: openWeatherResponse).main == "Rain" {
            uncheckedItems += ["Securing and managing drainage facilities sufficient for expected rainfall strength", "Measures to prevent rainwater penetration, such as gently cutting and soil gradient, and covering vinyl in case of urgent cutting/soil, etc", "Implementation of left and right drainage and compression reinforcement to prevent soil loss and subsidence on site roads on vehicle and construction machinery operating routes", "Minimize the extent of damage by blocking non-critical items except for electric wires to be used in an emergency in case of storm or heavy rain"]
        }
        
        if isAAASelected {
            uncheckedItems += ["Check for abnormalities in topography, geology, groundwater level, water condition, and surrounding environment", "Checking whether gas pipes, water and sewage pipes, telecommunications cable pipes, etc. are buried", "Check for installation of drainage channels for side and earthwork sections", "Check for measures to prevent inflow of surface water", "Preparation of a work plan for construction equipment such as excavators and dumps and confirmation of the placement of guides"]
        }
        if isBBBSelected {
            uncheckedItems += ["Check for installation of flame scattering prevention facilities during cutting, welding, and cutting operations", "Fire extinguishers should be placed around cutting, welding, and cutting work areas", "Do not place flammable substances such as styrofoam, urethane foam, oil, etc. around cutting, welding, or melting work areas", "Fire monitors are positioned when working with fire near materials at risk of ignition", "Check for gas leakage or residual gas before welding or cutting of pipes and containers where flammable gas is staying"]
        }
        if isCCCSelected {
            uncheckedItems += ["Establish the signal method for the lifting of steel components and place the inductor", "Work command is conducted to ensure that the steel frame assembly work is carried out according to construction procedures", "Deck plates minimize openings according to assembly order", "Install temporary ladders for safe climb/fall and use fall protection when assembling steel frames or renovating/repairing the plant", "Installation of fall protection net to prevent falling during steel assembly or roof renovation/repair work", "Install attachment facilities that can be safely hung and workers wear safety belts", "Simultaneous work on the upper and lower parts of the roof is prohibited, and fence and off-limit signs are installed to prevent other workers and the public from accessing the work area"]
        }
        
        if isDDDSelected {
            uncheckedItems += ["To prevent slipping or sinking on scaffolding columns, use base hardware or floorboards, etc., and install a bottom handle", "Securely secure horizontal  materials, braces, etc. to prevent  movement or  shaking of  scaffolding  columns", "Secure the work plate to two or more supports so that it does not deviate or fall off the longitudinal line of the scaffold", "Installation of  safety railings in corridors  where workers are likely  to fall , edges of work plates, around openings, and ramps", "At the first stage of a place where workers, pedestrians, vehicles, etc. are frequent, protective shelves are installed instead of falling object prevention nets"]
        }
        if isEEESelected {
            uncheckedItems += ["Inspect the work place and surrounding ground for cracks, water, or condition before excavation work", "Measures to prevent heavy objects such as excavated soil and materials from being deposited on the back ground of the soil barrier", "Check the condition and presence of deformation, corrosion, damage, and fall of the reinforcing member of the soil barrier", "Implement fundamental measures, such as mitigating slope’s slope, to stabilize slope", "Installation of safety signs and prohibition of workers from entering areas where danger is expected on cutting and soil slopes", "Installation of drainage channels such as mountain floor side vents to prevent inflow of rainwater, etc. on the upper part of the slope of cut and soil"]
        }
        if isRRRSelected {
            uncheckedItems += ["The operator must have a qualification (cradle: construction machinery operator's license, cargo crane: type 1 large license (12 tons or more), type 1 general license (less than 12 tons)", "Work with safety confirmed after reviewing whether ground subsidence occurs due to load on the lower surface", "Operation after setting load and allowable working radius suitable for boom length and angle", "Measures not to arbitrarily attach boarding facilities to the end of the boom"]
        }
        if isVVVSelected {
            uncheckedItems += ["The operator is qualified for (less than 3 tons: complete control training for small construction machinery, 3 tons or more: license for construction pilot)", "Prohibition of access to workers within the radius of work and rotation and deployment of guides for work command", "Fasten the connection between the excavator bucket and the boom", "Measures to prevent sudden driving or departure when the excavator is stopped"]
        }
        if isFFFSelected {
            uncheckedItems += ["The operator is qualified for (dump truck: type 1 large-sized license, construction machinery pilot license/freight truck: type 1 large license (12 tons or more), type 1 general license (less than 12 tons)", "Place a guide in case of danger of contact with workers within the work radius", "Control to prevent dump trucks from approaching the slope tip or the ground at risk of collapse", "Dump trucks are not overloaded with soil"]
        }
        if isOOOSelected {
            uncheckedItems += ["The driver is qualified for (less than 10 tons: type 1 general license, type 10 tons or more: type 1 large license)", "Ensure that the work place is free from the risk of conduction of facilities such as ground subsidence", "Operation after setting load and allowable working radius suitable for boom length and angle", "Safety rail installation of workstations"]
        }
        
        return uncheckedItems.filter { !selectedItems.contains($0) }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Weather").bold().font(.system(size: 28))) {
                if Weather(response: openWeatherResponse).tempt > 30 {
                    ChecklistSectionView(title: "Hot Weather", items: ["15 minutes or more break every hour", "In indoor workplaces, keep windows and doors open for natural ventilation and refrain from working in confined spaces", "Refrain from working outdoors between 2:00 PM and 5:00 PM", "Drink cool water or saline every 30 minutes while working (no caffeinated drinks)", "Even if it is hot, be careful not to be negligent in wearing protective equipment such as hard hats and safety belts", "Check workers who are vulnerable to heat illness in advance and prepare and check emergency contact networks"], selectedItems: $selectedItems)
                } else if Weather(response: openWeatherResponse).tempt < 0 {
                    ChecklistSectionView(title: "Cold Weather", items: ["Installation of facilities to provide hot water (including drinking water) to maintain body temperature", "A separate resting place is provided for resting while maintaining body temperature during resting hours", "Provision of protective equipment suitable for workers handling low-temperature objects such as winter helmets, winter shoes, and winter gloves", "Preparation for fire hazards caused by overheating of heating appliances", "Preparation of equipment and special tools for snow removal work"], selectedItems: $selectedItems)
                }
                if Weather(response: openWeatherResponse).main == "Rain" {
                    ChecklistSectionView(title: "Rainy day", items: ["Securing and managing drainage facilities sufficient for expected rainfall strength", "Measures to prevent rainwater penetration, such as gently cutting and soil gradient, and covering vinyl in case of urgent cutting/soil, etc", "Implementation of left and right drainage and compression reinforcement to prevent soil loss and subsidence on site roads on vehicle and construction machinery operating routes", "Minimize the extent of damage by blocking non-critical items except for electric wires to be used in an emergency in case of storm or heavy rain"], selectedItems: $selectedItems)
                }
                if noweather {
                    Text("Normal Weather").font(.system(size: 15)).foregroundColor(Color.green)
                }
                                    
            }
            
            Section(header: Text("Responsible Work")
                                .bold()
                                .font(.system(size: 28))) {
                if isAAASelected {
                    ChecklistSectionView(title: "EarthWorks", items: ["Check for abnormalities in topography, geology, groundwater level, water condition, and surrounding environment", "Checking whether gas pipes, water and sewage pipes, telecommunications cable pipes, etc. are buried", "Check for installation of drainage channels for side and earthwork sections", "Check for measures to prevent inflow of surface water", "Preparation of a work plan for construction equipment such as excavators and dumps and confirmation of the placement of guides"], selectedItems: $selectedItems)
                }
                                    
                if isBBBSelected {
                    ChecklistSectionView(title: "Welding & Cutting", items: ["Check for installation of flame scattering prevention facilities during cutting, welding, and cutting operations", "Fire extinguishers should be placed around cutting, welding, and cutting work areas", "Do not place flammable substances such as styrofoam, urethane foam, oil, etc. around cutting, welding, or melting work areas", "Fire monitors are positioned when working with fire near materials at risk of ignition", "Check for gas leakage or residual gas before welding or cutting of pipes and containers where flammable gas is staying"], selectedItems: $selectedItems)
                }
                                    
                if isCCCSelected {
                    ChecklistSectionView(title: "Factory Construction, Demolition, Renovation, Refair Works", items: ["Establish the signal method for the lifting of steel components and place the inductor", "Work command is conducted to ensure that the steel frame assembly work is carried out according to construction procedures", "Deck plates minimize openings according to assembly order", "Install temporary ladders for safe climb/fall and use fall protection when assembling steel frames or renovating/repairing the plant", "Installation of fall protection net to prevent falling during steel assembly or roof renovation/repair work", "Install attachment facilities that can be safely hung and workers wear safety belts", "Simultaneous work on the upper and lower parts of the roof is prohibited, and fence and off-limit signs are installed to prevent other workers and the public from accessing the work area"], selectedItems: $selectedItems)
                }
                                    
                if isDDDSelected {
                    ChecklistSectionView(title: "Scaffolding Works", items: ["To prevent slipping or sinking on scaffolding columns, use base hardware or floorboards, etc., and install a bottom handle", "Securely secure horizontal  materials, braces, etc. to prevent  movement or  shaking of  scaffolding  columns", "Secure the work plate to two or more supports so that it does not deviate or fall off the longitudinal line of the scaffold", "Installation of  safety railings in corridors  where workers are likely  to fall , edges of work plates, around openings, and ramps", "At the first stage of a place where workers, pedestrians, vehicles, etc. are frequent, protective shelves are installed instead of falling object prevention nets"],
                        selectedItems: $selectedItems)
                }
                if isEEESelected {
                    ChecklistSectionView(title: "Pipeline Construction", items: ["Inspect the work place and surrounding ground for cracks, water, or condition before excavation work", "Measures to prevent heavy objects such as excavated soil and materials from being deposited on the back ground of the soil barrier", "Check the condition and presence of deformation, corrosion, damage, and fall of the reinforcing member of the soil barrier", "Implement fundamental measures, such as mitigating slope’s slope, to stabilize slope", "Installation of safety signs and prohibition of workers from entering areas where danger is expected on cutting and soil slopes", "Installation of drainage channels such as mountain floor side vents to prevent inflow of rainwater, etc. on the upper part of the slope of cut and soil"], selectedItems: $selectedItems)
                }
                if nowork {
                    Text("No Works").font(.system(size: 15)).foregroundColor(Color.green)
                }
                                    
                                    
            }
        
            Section(header: Text("Equipment Used")
                                .bold()
                                .font(.system(size: 28))) {
                if isRRRSelected {
                    ChecklistSectionView(title: "Mobile Crane", items: ["The operator must have a qualification (cradle: construction machinery operator's license, cargo crane: type 1 large license (12 tons or more), type 1 general license (less than 12 tons)", "Work with safety confirmed after reviewing whether ground subsidence occurs due to load on the lower surface", "Operation after setting load and allowable working radius suitable for boom length and angle", "Measures not to arbitrarily attach boarding facilities to the end of the boom"], selectedItems: $selectedItems)
                }
            
                if isVVVSelected {
                    ChecklistSectionView(title: "Excavator", items: ["The operator is qualified for (less than 3 tons: complete control training for small construction machinery, 3 tons or more: license for construction pilot)", "Prohibition of access to workers within the radius of work and rotation and deployment of guides for work command", "Fasten the connection between the excavator bucket and the boom", "Measures to prevent sudden driving or departure when the excavator is stopped"], selectedItems: $selectedItems)
                }
            
                if isFFFSelected {
                    ChecklistSectionView(title: "A Dump/Freight Truck", items: ["The operator is qualified for (dump truck: type 1 large-sized license, construction machinery pilot license/freight truck: type 1 large license (12 tons or more), type 1 general license (less than 12 tons)", "Place a guide in case of danger of contact with workers within the work radius", "Control to prevent dump trucks from approaching the slope tip or the ground at risk of collapse", "Dump trucks are not overloaded with soil"], selectedItems: $selectedItems)
                }
                if isOOOSelected {
                    ChecklistSectionView(title: "Elevated Workstation", items: ["The driver is qualified for (less than 10 tons: type 1 general license, type 10 tons or more: type 1 large license)", "Ensure that the work place is free from the risk of conduction of facilities such as ground subsidence", "Operation after setting load and allowable working radius suitable for boom length and angle", "Safety rail installation of workstations"], selectedItems: $selectedItems)
                }
                if noequip {
                    Text("No Equipments").font(.system(size: 15)).foregroundColor(Color.green)
                }
            }
        
            NavigationLink(destination: ResultView(toggledCount: selectedItems.count, uncheckedItems: uncheckedItems)) {
                Text("Summary")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(13)
            }
        }
    }
}


struct ChecklistSectionView: View {
    let title: String
    let items: [String]
    @Binding var selectedItems: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(items, id: \.self) { item in
                ChecklistItemView(item: item, isSelected: selectedItems.contains(item)) {
                    if selectedItems.contains(item) {
                        selectedItems.removeAll(where: { $0 == item })
                    } else {
                        selectedItems.append(item)
                    }
                }
            }
        }
        .padding()
    }
}


struct ChecklistItemView: View {
    let item: String
    let isSelected: Bool
    let toggleSelection: () -> Void
    
    var body: some View {
        Button(action: toggleSelection) {
            HStack {
                Text(item)
                    .font(.body)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .blue : .gray)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.vertical, 4)
    }
}


