//
//  Onboarding.swift
//  Gera
//
//  Created by Julia Machado on 02/03/21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var icon = ["paperplane.fill",
                               "creditcard.fill",
                               "square.and.arrow.up.fill"]
    @State private var title = ["Pirangagem nunca mais.",
                                "Sem desculpinha.",
                                "Pra pagar nem precisa do app."]
    @State private var subtitle = ["Crie cartões personalizados de cobrança de forma simples e rápida.",
                                   "Suportamos várias formas de pagamento, de transferência até boleto bancários.",
                                   "Compartilhe os cartões em qualquer rede social, ou adicione ao Apple Wallet."]
    @State private var showModal = false
    
    var body: some View {
        
        VStack{
            LargeTitle(largeTitle: .constant("Cobrança?"))
            LargeTitle(largeTitle: .constant("A gente gera."))
                .foregroundColor(Color(.systemPurple))
            Spacer().frame(height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            OnboardingBlocks(icon: $icon[0], title: $title[0], subtitle: $subtitle[0])
            Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            OnboardingBlocks(icon: $icon[1], title: $title[1], subtitle: $subtitle[1])
            Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            OnboardingBlocks(icon: $icon[2], title: $title[2], subtitle: $subtitle[2])
            Spacer().frame(height: 35, alignment: .center)
            GeraButton(name: Binding.constant("Começar"), action: {showModal.toggle()})
                .sheet(isPresented: $showModal) {
                    CardCustomizationView(showModal: self.$showModal)
                }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .previewDevice("iPhone 11")
            OnboardingView()
                .previewDevice("iPhone 8")
            OnboardingView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
