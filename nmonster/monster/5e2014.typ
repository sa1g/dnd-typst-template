#import "@local/mythographer-5e:0.0.1": call-if-fn

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
#import "5e2014/act-bon-react.typ": render-act-bon-react, render-legendary-action
#import "process/shortname.typ": compute-shortname

#import "process/tmp.typ"

#let monster-5e(self, body) = context {
  set text(font: self.font.monster.font, size: self.font.monster.size)
  // Monster Name
  set heading(outlined: false)

  show heading.where(level: 1): it => {
    set text(
      size: self.font.monster.title.size,
      weight: self.font.monster.title.weight,
      font: self.font.monster.title.font,
      fill: self.fill.monster.title,
    )
    it.body
  }

  // Heading w/RedBar (Actions/BonusActions/Reactions/Legendary/Mythic)
  show heading.where(level: 2): it => {
    set text(size: self.font.monster.subtitle.size, fill: self.fill.monster.title)
    
    call-if-fn(self.font.monster.subtitle.style, it.body)
    v(-12pt)
    line(stroke: 0.7pt + self.fill.monster.title, length: 100%)
  }

  // Specs
  show heading.where(level: 3): it => {
    set text(
      size: self.font.monster.size,
      fill: self.fill.monster.title,
      weight: self.font.monster.title.weight,
    )
    it.body + ":"
  }

  // Spells/Traits/Actions
  show heading.where(level: 4): it => {
    set text(
      size: self.font.monster.size,
      fill: black,
      weight: "bold",
      style: "italic",
    )
    it.body + "."
  }

  // Add short name as it's needed e.g. in `legendary action headers`
  let body = compute-shortname(body)
  [
    #render-name(self, body)
    #linebreak()
    #render-size-type(self, body), #render-alignment(self, body) #linebreak()
    #triangle-bar(self)
    // // AC HP SPEED
    #render-ac(self, body) #linebreak()
    #render-hp(self, body) #linebreak()
    #render-speed(self, body) #linebreak()
    #triangle-bar(self)
    // ABILITY SCORES
    #render-abilities(self, body)
    #triangle-bar(self)
    // SPECS
    #render-specs(self, body)
    #triangle-bar(self)
    // TRAITS + SPELLCASTING
    #render-traits(self, body)
    // ACTIONS - BONUS - REACTIONS (they have the same structure)
    #render-act-bon-react(self, "action", body)
    #render-act-bon-react(self, "reaction", body)
    #render-act-bon-react(self, "bonus", body)
    // LEGENDARY - very similar to actions. Wrapper to add custom heading.
    #render-legendary-action(self, body)
    #render-act-bon-react(self, "mythic", body)
  ]
}
