#import "utils.typ": capitalize, translate-top-level-word-if-possible


#import "visual.typ": triangle-bar


#import "5e2014/name.typ": render-name
#import "5e2014/size-type.typ": render-size-type
#import "5e2014/alignment.typ": render-alignment
#import "5e2014/armor-class.typ": render-ac
#import "5e2014/hit-points.typ": render-hp
#import "5e2014/speed.typ": render-speed
#import "5e2014/ability-modifiers.typ": render-abilities
#import "5e2014/specs.typ": render-specs
#import "5e2014/traits.typ": render-traits





///////////////////////////////////////////////////
/// MONSTER RENDER

// keys i don't care about:
// shortName, alias, group, sizeNote, source, sourceSub, otherSources, referenceSources, reprintedAs,
// isReprinted, tool and gear (as currently sidekicks aren't supported),  pbNote, actionNote, actionHeader, bonusNote, bonusHeader, reactionNote, reactionHeader, legendaryGroup, page, additionalSources, hasToken, tokenCredit, tokenCustom, foundryTokenScale, altArt, token, isNamedCreature, isNpc, soundClip, dragonCastingColor, dragonAge, traitTags, actionTags, languageTags, senseTags, spellcastingTags, damageTags, damageTagsSpell, damageTagsLegendary, attachedItems,conditionInflict, conditionInflictLegendary, conditionInflictSpell, savingThrowForced, savingThrowForcedLegendary, savingThrowForcedSpell, footer, legacy, _isCopy, _verions, hasFluff, hasFluffImages
//


#let to-remove = (
  "shortName",
  "alias",
  "group",
  "sizeNote",
  "source",
  "sourceSub",
  "otherSources",
  "referenceSources",
  "reprintedAs",
  "isReprinted",
  "tool",
  "gear",
  "pbNote",
  "actionNote",
  "actionHeader",
  "bonusNote",
  "bonusHeader",
  "reactionNote",
  "reactionHeader",
  "legendaryGroup",
  "page",
  "additionalSources",
  "hasToken",
  "tokenCredit",
  "tokenCustom",
  "foundryTokenScale",
  "altArt",
  "token",
  "isNamedCreature",
  "isNpc",
  "soundClip",
  "dragonCastingColor",
  "dragonAge",
  "traitTags",
  "actionTags",
  "languageTags",
  "senseTags",
  "spellcastingTags",
  "damageTags",
  "damageTagsSpell",
  "damageTagsLegendary",
  "attachedItems",
  "conditionInflict",
  "conditionInflictLegendary",
  "conditionInflictSpell",
  "savingThrowForced",
  "savingThrowForcedLegendary",
  "savingThrowForcedSpell",
  "footer",
  "legacy",
  "_isCopy",
  "_versions",
  "hasFluff",
  "hasFluffImages",
)

#let remove-if-present(keys, json-file) = {
  let json-keys = json-file.keys()
  let json-file = json-file
  for key in keys {
    if key in json-keys {
      // json-file.remove(key)
      let na = json-file.remove(key)
    }
  }
  return json-file
}

#let monster-5e(self, body) = context {
  let body = remove-if-present(to-remove, body)
  return [
    #set text(font: self.font.monster.font, size: self.font.monster.size)
    #render-name(self, body)
    #linebreak()
    // // Need a better way to translate, while keeping a correct word order
    // // of size, type and alignment (e.g. in english we have "Medium Undead, Neutral Evil"
    // // in italian is "Umanoide Medi*o*, Neutrale Malvagi*o*", but as the language doesn't have
    // // a neutral form we have e.g. plants: "Mostruosità" [monstrosity] medi*a*, neutrale malvagi*a*.)
    #render-size-type(self, body), #render-alignment(self, body)
    #triangle-bar(self)
    // // AC HP SPEED
    #render-ac(self, body) #linebreak()
    #render-hp(self, body) #linebreak()
    #render-speed(self, body)
    #triangle-bar(self)
    // // ABILITY SCORES
    #render-abilities(self, body)
    #triangle-bar(self)
    // SPECS
    #render-specs(self, body)
    #triangle-bar(self)
    // TRAITS
    #render-traits(self, body)
    // traits
    // spellcasting (?)

    // ACTIONS

    // BONUS

    // REACTIONS

    // LEGENDARY

  ]
}
