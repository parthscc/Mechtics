//
//  Data.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import Foundation

struct Note{
    var title: String
    var note: String
    var date: Date
    init(){
        title = ""
        note = ""
        date = Date()
    }
}
struct Blogs{
    var name: String
    var url: String
}
let options = ["Home","Blogs","Notes","Jobs","Exam","Guest Post","Privacy Policy","Rate us"]

var blogsArr = [Blogs(name: "CNC definition and CNC machine working", url: "https://mechtics.com/manufacture/production/cnc-definition-and-cnc-machine-working/"),Blogs(name: "Cement production process in factory", url: "https://mechtics.com/manufacture/production/cement-production-process-in-factory/"),Blogs(name: "Types of load in strength of material", url: "https://mechtics.com/design/strength-of-material/types-of-load-in-strength-of-material/"),Blogs(name: "ISO 9001 internal audit checklist for manufacturing companies", url: "https://mechtics.com/manufacture/production/iso-9001-internal-audit-checklist-for-manufacturing-companies/"),Blogs(name: "Stress strain curve for mild steel with defination of stress and strain", url: "https://mechtics.com/design/strength-of-material/stress-strain-curve-for-mild-steel-with-defination-of-stress-and-strain/"),Blogs(name: "Calorific value formula and types of calorific value", url: "https://mechtics.com/energy/calorific-value-formula-and-types-of-calorific-value/"),Blogs(name: "Gear terminology with defination", url: "https://mechtics.com/machine/theory-of-machines/gear-terminology-with-defination/"),Blogs(name: "System and surroundings in thermodynamics", url: "https://mechtics.com/energy/thermodynamics/system-and-surroundings-in-thermodynamics/"),Blogs(name: "Types of heat exchanger", url: "https://mechtics.com/energy/heat-mass-transfer/types-of-heat-exchanger/"),Blogs(name: "Thermal conductivity of material", url: "https://mechtics.com/energy/heat-mass-transfer/thermal-conductivity-of-material/"),Blogs(name: "Thermal conduction mechanism in solid liquid and gas", url: "https://mechtics.com/energy/heat-mass-transfer/thermal-conduction-mechanism-in-solid-liquid-and-gas/"),Blogs(name: "Cutting tool terminology with detailed explanation", url: "https://mechtics.com/manufacture/production/cutting-tool-terminology-with-detailed-explanation/"),Blogs(name: "Definition of mechanical properties of materials", url: "https://mechtics.com/manufacture/project-management/definition-of-mechanical-properties-of-materials/"),Blogs(name: "Classification of kinematic pairs", url: "https://mechtics.com/machine/mechanics-of-machines/classification-of-kinematic-pairs/"),Blogs(name: "What is degree of freedom in mechanics", url: "https://mechtics.com/machine/mechanics-of-machines/what-is-degree-of-freedom-in-mechanics/"),Blogs(name: "Cam and follower mechanism types and functions", url: "https://mechtics.com/machine/mechanics-of-machines/cam-and-follower-mechanism-types-and-functions/"),Blogs(name: "Mechanism and types of mechanism in mechanical engineering", url: "https://mechtics.com/machine/mechanics-of-machines/mechanism-and-types-of-mechanism-in-mechanical-engineering/"),Blogs(name: "Types of constrains in any mechanism or machines", url: "https://mechtics.com/machine/mechanics-of-machines/types-of-constrains-in-any-mechanism-or-machines/")]


