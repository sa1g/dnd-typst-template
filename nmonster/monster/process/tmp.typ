
// #import	"/includes/functions.typst"	:   *


#let	render(
		caster				: (:),
		z,
	)				= {

	let	abilities			= (
		"Charisma",
		"Constitution",
		"Dexterity",
		"Intelligence",
		"Strength",
		"Wisdom",
	)

	let	keywords			= (
		regu				: (
			"item",
		),
		ital				: (
			"i",
			"spell",
		),
		bold				: (
			"b",
			"action",
			"adventure",
			"classFeature",
			"condition",
			"hit",
			"dice",
			"scaledice",		// Temp?
			"sense",
			"status",
		),
	)

	let	regexen				= (
		filter				:   regex("\{@filter ([^|}]+).*?\}"),
		book				:   regex("\{@book ([^|}]+)\|([^|}]+)(.*?)\}"),
		learn				:   regex("(Beginning a|Starting a|A)t \d+\S\S level,\s+(\S)"),
		units				:   regex("(\d+)\s(\w+)"),
		attack				:   regex("([Mm]ake a (\w+) spell attack)"),
		saves				:   regex("(make|succeed on)( a)? (" + abilities.join("|") + ") (saving throws?)( against your spell save DC)?"),
		modifier			:   regex("(\+|plus) your spellcasting ability modifier"),			// #TODO which can I nuke?
		level				:   regex("a number of (.*?) equal to your (\w+) level"),
		damage_stat			:   regex("(\w+) damage equal to your spellcasting ability modifier"),	// #TODO which can I nuke?
		damage_roll			:   regex("\{@damage (\d*)d(\d+)(\s+[+-]\s+(\d+d)?\d+)?\}(\s+\w+ damage|\s+damage of that type)?"),
		bonus				:   regex("\{@d20 (\d+)\}"),
		chance				:   regex("\{@chance ([^}]+)\}"),
		skill_check			:   regex("(" + abilities.join("|") + ") \(\{@skill ([^}]+)\}\)"),
		skill_name			:   regex("\{@skill ([^}]+)\}"),
		scale				:   regex("\{@scaledamage ([^}]+)\}"),
		quick				:   regex("\{@quickref ([^}]+)\}"),
		target				:   regex("\{@(object|creature) ([^}]+)\}"),
		race				:   regex("\{@race ([^}]+)\}"),
		note				:   regex("\{@note (.+)\}"),
		variant				:   regex("\{@variantrule ([^}]+)\}"),
		misc_regu			:   regex("\{@(" + keywords.regu.join("|") + ") ([^|}]+).*?\}"),
		misc_ital			:   regex("\{@(" + keywords.ital.join("|") + ") ([^|}]+).*?\}"),
		misc_bold			:   regex("\{@(" + keywords.bold.join("|") + ") ([^|}]+).*?\}"),

		// Bespoke
		spell_attack			:   regex("\{@spell_attack\}"),
	)


	show	regexen.filter			:   z => {
		let	(text, )			=   z.text.match(regexen.filter).captures
		text
	}

	show	regexen.book			:   z => {
		let	(book, _, extra)		=   z.text.match(regexen.book).captures
		if (extra.len() > 0) {
			book
		} else {
			text(
				style				: "italic",
				mu(book),
			)
		}
	}

	show	regexen.learn			:   z => {
		let	(_, letter, )			=   z.text.match(regexen.learn).captures

		cap(letter)
	}

	show	regexen.units			:   z => {
		let	(num, units)			=   z.text.match(regexen.units).captures

		[#{num}~#(units)]
	}

	show	regexen.attack			:   z => {
		let	(blob, _)			=   z.text.match(regexen.attack).captures

		// Show rule that cascades into another show rule.
		[#blob ({\@spell_attack})]
	}

	show	regexen.saves			:   z => {
		let	(make, a, saving, throw, _)	=   z.text.match(regexen.saves).captures

		strong([#make#a DC~#caster.spell.save #saving #throw])
	}

	show	regexen.modifier		:   z => strong([\+ #caster.spell.damage])

	show	regexen.level			:   z => {
		let	(thing, class)			=   z.text.match(regexen.level).captures

		strong[#{caster.level}~#{thing}]
	}

	show	regexen.damage_stat		:   z => {
		let	(type, )			=   z.text.match(regexen.damage_stat).captures

		strong[#{bonus(caster.spell.damage)} #{type} damage]
	}

	show	regexen.damage_roll		:   z => {
		let	(dice, size, mod, _, types)	=   z.text.match(regexen.damage_roll).captures
		let	space				=   regex("\s+")

		if (mod != none) {
			mod				=   mod.replace(space, sym.space.nobreak)
		}

		if (types != none) {
			types				= (" " + types).replace(space, sym.space.nobreak)
		}

		strong[#{dice}d#{size}#{mod}#{types}]
	}

	show	regexen.bonus			:   z => {
		let	(num, )				=   z.text.match(regexen.bonus).captures

		bonus(int(num))
	}

	show	regexen.chance			:   z => {
		let	(blob, )		=   z.text.match(regexen.chance).captures
		let	 bits			=   blob.split("|")

		bits.first() + [%]
	}

	show	regexen.skill_check		:   z => {
		let	(ability, skill)		=   z.text.match(regexen.skill_check).captures

		strong([#{ability} (#{skill})])
	}

	show	regexen.skill_name		:   z => {
		let	(blob, )		=   z.text.match(regexen.skill_name).captures
		let	 bits			=   blob.split("|")

		bits.first()
	}

	show	regexen.scale			:   z => {
		let	(blob, )		=   z.text.match(regexen.scale).captures

		strong(blob.split("|").last())
	}

	show	regexen.quick			:   z => {
		let	(blob, )		=   z.text.match(regexen.quick).captures
		let	 bits			=   blob.split("|")

		if (bits.len() > 3) {
			strong(bits.last())
		} else {
			strong(bits.first())
		}
	}

	show	regexen.target			:   z => {
		let	(keyword, blob)		=   z.text.match(regexen.target).captures
		let	 bits			=   blob.split("|")

		if (bits.len() > 2) {
			strong(bits.last())
		} else {
			strong(bits.first())
		}
	}

	show	regexen.race			:   z => {
		let	(blob, )		=   z.text.match(regexen.race).captures

		strong(blob.split("|").last())
	}

	show	regexen.note			:   z => {
		let	(blob, )		=   z.text.match(regexen.note).captures

		strong("Note: ") + blob
	}

	show	regexen.variant			:   z => {
		let	(blob, )		=   z.text.match(regexen.variant).captures
		let	 bits			=   blob.split("|")

		if (bits.len() > 2) {
			strong(bits.last())
		} else if (bits.last() != "XPHB") {
			strong(bits.first())
		} else {
			bits.first()
		}
	}

	show	regexen.misc_regu		:    z => {
		mu(z.text.match(regexen.misc_regu).captures.at(1))
	}

	show	regexen.misc_ital		:  z => {
		// Not using the Emphasise function here because it’s not semantically emphasised text: it’s a document citation.
		text(
			style				:  "italic",
			mu(z.text.match(regexen.misc_ital).captures.at(1)),
		)
	}

	show	regexen.misc_bold		:   z => {
		strong(mu(z.text.match(regexen.misc_bold).captures.at(1)))
	}


	show	regexen.spell_attack		:   z => {
		strong(bonus(caster.prof + caster.ability))
	}


	z
}
