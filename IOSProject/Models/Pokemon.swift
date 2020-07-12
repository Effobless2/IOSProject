//
//  File.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

func getColorFromType(type: PokemonType) -> Color {
    switch (type) {
        case PokemonType.fire:
            return Color.red;
        case PokemonType.water:
            return Color.blue;
        case PokemonType.thunder:
            return Color.yellow;
        default:
            return Color.green;
    }
}

enum PokemonType: String, CaseIterable, Identifiable {
    case fire, water, grass, thunder
    
    var id: PokemonType {
        return self
    }
}
class Pokemon: Identifiable, Equatable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id;
    }
    
    
    init(name: String, pokedexNumber: Int, type: PokemonType, description: String) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
        self.description = description;
        self.type = type;
        self.image = nil;
    }
    
    init(name: String, pokedexNumber: Int, type: PokemonType, description: String, image: Data?) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
        self.description = description;
        self.type = type;
        self.image = image;
    }
    
    init(id: UUID, name: String, pokedexNumber: Int, type: PokemonType, description: String, image: Data?) {
        self.id = id;
        self.name = name;
        self.pokedexNumber = pokedexNumber;
        self.description = description;
        self.type = type;
        self.image = image;
    }
    
    var id = UUID();
    var name: String;
    var pokedexNumber: Int;
    var description: String;
    var type: PokemonType;
    var caught: Bool = false;
    var image: Data?;
    
    
    func genDAO(context: NSManagedObjectContext) -> PokemonDAO {
        let result = PokemonDAO(context: context);
        result.id = self.id;
        result.name = self.name;
        result.pokedexNumber = NSNumber(value:self.pokedexNumber);
        result.pokemonDescription = self.description;
        result.pokemonType = self.type.rawValue;
        result.caught = NSNumber(value: self.caught);
        result.image = NSData(data: self.image ?? Data.init(count: 0));
        return result;
    }
}

class PokemonDAO: NSManagedObject, Identifiable {
    @NSManaged var id: UUID?;
    @NSManaged var name: String?;
    @NSManaged var pokedexNumber: NSNumber?;
    @NSManaged var pokemonDescription: String?;
    @NSManaged var pokemonType: String?;
    @NSManaged var caught: NSNumber?;
    @NSManaged var image: NSData?;
    
    var model: Pokemon {
        get {
            return Pokemon(
                id: self.id!,
                name: self.name!,
                pokedexNumber: Int(truncating: self.pokedexNumber!),
                type: PokemonType(rawValue: self.pokemonType!) ?? PokemonType.fire,
                description: self.pokemonDescription ?? "",
                image: self.image != nil ? UIImage(data: self.image! as Data)!.pngData() : nil
            );
        }
    }
}

extension PokemonDAO {
    static func fetchAllPokemon() -> NSFetchRequest<PokemonDAO> {
        let request: NSFetchRequest<PokemonDAO> = PokemonDAO.fetchRequest() as! NSFetchRequest<PokemonDAO>;
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true);
        request.sortDescriptors = [sortDescriptor];
        return request;
    }
}
