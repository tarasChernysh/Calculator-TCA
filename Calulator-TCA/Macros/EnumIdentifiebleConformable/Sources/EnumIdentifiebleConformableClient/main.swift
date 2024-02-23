import EnumIdentifiebleConformable

let a = 17
let b = 25

let (result, code) = #stringify(a + b)

@IdentifiableConfirmation
public enum ShapeType: String {
	case circle
}
