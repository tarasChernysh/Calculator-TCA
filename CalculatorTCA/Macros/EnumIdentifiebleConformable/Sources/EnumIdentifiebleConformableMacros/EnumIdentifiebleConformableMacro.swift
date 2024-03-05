import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
	public static func expansion(
		of node: some FreestandingMacroExpansionSyntax,
		in _: some MacroExpansionContext
	) -> ExprSyntax {
		guard let argument = node.argumentList.first?.expression else {
			fatalError("compiler bug: the macro does not have any arguments")
		}

		return "(\(argument), \(literal: argument.description))"
	}
}

public struct EnumIdentifiebleConformableMacro: ExtensionMacro {
	public static func expansion(
		of _: AttributeSyntax,
		attachedTo _: some DeclGroupSyntax,
		providingExtensionsOf type: some TypeSyntaxProtocol,
		conformingTo _: [TypeSyntax],
		in _: some MacroExpansionContext
	) throws -> [ExtensionDeclSyntax] {
		let sendableExtension: DeclSyntax =
			"""
			extension \(type.trimmed): Identifiable {
			  public var id: String { rawValue }

			}
			"""
		guard let extensionDecl = sendableExtension.as(ExtensionDeclSyntax.self) else {
			return []
		}

		return [extensionDecl]
	}
}

@main
struct EnumIdentifiebleConformablePlugin: CompilerPlugin {
	let providingMacros: [Macro.Type] = [
		StringifyMacro.self,
		EnumIdentifiebleConformableMacro.self
	]
}
