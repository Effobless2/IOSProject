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
    
    init(name: String, pokedexNumber: Int, type: PokemonType, description: String, image: Image?) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
        self.description = description;
        self.type = type;
        self.image = image;
    }
    
    init(id: UUID, name: String, pokedexNumber: Int, type: PokemonType, description: String, image: Image?) {
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
    var image: Image?;
    
    
    func genDAO(context: NSManagedObjectContext) -> PokemonDAO {
        let result = PokemonDAO(context: context);
        result.setValue(self.id, forKeyPath: "id");
        result.setValue(self.name, forKey: "name");
        result.setValue(NSNumber(value:self.pokedexNumber), forKey: "pokedexNumber");
        result.setValue(self.description, forKey: "pokemonDescription");
        result.setValue(self.type.rawValue, forKey: "pokemonType");
        result.setValue(NSNumber(value: self.caught), forKey: "caught");
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
    
    var model: Pokemon {
        get {
            return Pokemon(
                id: self.id!,
                name: self.name!,
                pokedexNumber: Int(truncating: self.pokedexNumber!),
                type: PokemonType(rawValue: self.pokemonType!) ?? PokemonType.fire,
                description: self.pokemonDescription ?? "",
                image: Image(self.name ?? "")
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
