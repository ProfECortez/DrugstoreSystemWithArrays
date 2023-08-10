/*
    Exemplo de um sistema de farmácia estruturado em funções que utilizam vetores como principal recurso para armazenamento de dados.
 
    Código desenvolvido para acompanhar o Módulo 2 - Aula 03 do curso de desenvolvimento de aplicativos para o iOS Lab no Brasil.
 
    Observação: aqui estamos exemplificando um código bastante simples, sem o controle de letras maiúsculas e minúsculas, que seria interessantes termos em um sistema. Também não estamos prevendo a possibilidade de o usuário desejar abortar a ação no meio do processo.
 
    Autoria: Eduardo Cortez, 2023
 */

import Foundation

// ------ ESTUDANTE 1 ------
// Trabalha com vetor de medicamentos.

var medicines = [String]()

var newMedicine = String()
var medicineToBeRemoved = String()
var index = 0


func addMedicineToMedicines() {
       
    print("\nInsira o nome do remédio que deseja inserir no sistema")
    newMedicine = readLine()!
    
    medicines.append(newMedicine)
    
    print("\nExcelente! O remédio \(newMedicine) foi inserido à liste de remédios no sistema")
    
    createSupplyForMedicine() //Note que essa é uma função criada pelo Estudante 2
    addItemPrice() //Note que essa é uma função criada pelo Estudante 3
    
}

func removeMedicineFromMedicines() {
       
    index = 0
    
    print("\nQual medicamento deseja remover de sua lista?")
    medicineToBeRemoved = readLine()!
    
    for medicine in medicines {
        if medicines[index] == medicineToBeRemoved {
            medicines.remove(at: index)
            
            deleteSupplyForMedicine() //Note que essa é uma função criada pelo Estudante 2
            //removeItemPrice()
        }
        index += 1
    }
    
    print("\nPronto! O medicamento \(medicineToBeRemoved) foi removido do sistema.")
    
    
    
}

func listMedicinesInTheSystem() {
    
    index = 0
    
    print("\nAqui está a lista dos medicamentos no sistema:")
    
    for medicine in medicines {
        print(medicines[index])
        index += 1
    }
}


// ------ ESTUDANTE 2 ------
// Trabalha com o vetor de estoque.
// Importante: note que as funções aqui utilizadas dependem de variáveis que foram criadas pelo estudante 1. Por isso o grupo deve estar em comunicação constante.

var medicinesSupply = [Int]()

var supplyToBeAdded = Int()
var updateValue = Int()
var medicineSupplyToBeUpdated = String()

func createSupplyForMedicine() {
    
    print("\nQuantos ítens desse medicamento devem ser adicionados ao estoque?")
    supplyToBeAdded = Int(readLine()!)!
    
    medicinesSupply.append(supplyToBeAdded)
    
    print("\nFeito. Agora seu estoque tem \(supplyToBeAdded) unidades do medicamento \(newMedicine)")
    
}

func deleteSupplyForMedicine() {
    
    medicinesSupply.remove(at: index)
    print("\nO registro de estoque do medicamento \(medicineToBeRemoved) também foi apagado")
    
}

func listSuppliesAmount() {
    
    index = 0
    
    print("\nAqui está a lista da quantidade de cada remédio em estoque:")
    
    for medicine in medicines {
        print("\(medicines[index]) - \(medicinesSupply[index])")
    }
    
}

func updateSupplyValue() {
    
    index = 0
    
    print("\nVocê deseja atualizar o valor de estoque de qual medicamento?")
    medicineSupplyToBeUpdated = readLine()!
    
    for medicine in medicines {
        if medicines[index] == medicineSupplyToBeUpdated{
            
            print("\nAtualmente, há \(medicinesSupply[index]) unidades do medicamento \(medicineSupplyToBeUpdated) em nosso estoque. \nQual novo valor deseja inserir no sistema?")
            
            updateValue = Int(readLine()!)!
            
            medicinesSupply[index] = updateValue
            
            print("\nPronto. Agora há \(updateValue) unidades do medicamento \(medicineSupplyToBeUpdated).")
            
        }
    }
    
}


// ------ ESTUDANTE 3 ------
// Trabalha com o vetor de preços.
// Observção: as funções criadas por esse estudante são particularmente parecidas com as funções criadas pelo estudante 2. E esse também seria o caso se tivéssemos um 4º estudante. Isso acontece porque essas alunas e alunos estão trabalhando com dados correlacionados ao produto do Estudante 1, e a maneira de operar esses dados é similar. Se algum deses estudantes estiver com dificuldade, pode-se orientar que eles trabalhem juntos.

var prices = [Double]()

var newPrice = Double()
var updatedPrice = Double()
var medicinePriceToBeUpdated = String()

func addItemPrice() {
    
    print("\nQual será o preço desse medicamento?")
    print("$", terminator: " ")
    
    newPrice = Double(readLine()!)!
    
    prices.append(newPrice)
    
    print("\nFeito. O medicamento \(newMedicine) custa $\(newPrice)")
    
}

func removeItemPrice() {
    
    prices.remove(at: index)
    print("\nO registro de preço do medicamento \(medicineToBeRemoved) também foi apagado")
    
}

func listPrices() {
    
    index = 0
    
    print("\nAqui está a lista da remédios com seus preços:")
    
    for medicine in medicines {
        print("\(medicines[index]) - $\(prices[index])")
    }
    
}

func updatePrice() {
    
    index = 0
    
    print("\nVocê deseja atualizar o preço de qual medicamento?")
    medicinePriceToBeUpdated = readLine()!
    
    for medicine in medicines {
        if medicines[index] == medicinePriceToBeUpdated{
            
            print("\nAtualmente, o medicamento \(medicinePriceToBeUpdated) custa \(prices[index]). \nQual novo preço deseja inserir no sistema?")
            print("$", terminator: " ")
            
            updatedPrice = Double(readLine()!)!
            
            prices[index] = updatedPrice
            
            print("\nPronto. Agora o valor do medicamento \(medicinePriceToBeUpdated) é \(updateValue).")
            
        }
    }
    
}

// Teste do sistema rodando com as funções unificadas:

addMedicineToMedicines()
listMedicinesInTheSystem()
listSuppliesAmount()
listPrices()

updateSupplyValue()
listSuppliesAmount()

updatePrice()
listPrices()

removeMedicineFromMedicines()
listMedicinesInTheSystem()
listSuppliesAmount()
listPrices()
