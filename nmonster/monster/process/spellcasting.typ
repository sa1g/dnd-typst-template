// 14/02/2026
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/entry.json
// Possible `spellcasting` data entries are as follows:
//
// array:
//   > dict:
//      > name: str -- required
//      > type: str -- required
//      > headerEntries: array: str
//      > constant: _arrayOfSpell
//      > will: _arrayOfSpell
//      > ritual: _arrayOfSpell
//      > rest: entrySpellcasting_frequency
//      > restLong: entrySpellcasting_frequency
//      > daily: entrySpellcasting_frequency
//      > weekly: entrySpellcasting_frequency
//      > monthly: entrySpellcasting_frequency
//      > yearly: entrySpellcasting_frequency
//      > charges: entrySpellcasting_frequency
//      > recharge: entrySpellcasting_recharge
//      > legendary: entrySpellcasting_frequency
//      > spells: dict:
//      >    > `0` (cantrips) array: str
//      >    > others: entrySpellcasting_level1to9
//      > footerEntries: array: str


// _arrayOfSpell
// array:
//    > str
//    > dict:
//        > `entry`: str -- required
//        > `hidden`: bool -- required


// entrySpellcasting_frequency
// dict:
//    "1", "2", ... "9", "1e", ..., "9e": _arrayOfSpell


// entrySpellcasting_recharge
// dict:
//    "1", ..., "6": _arrayOfSpell


#import "@preview/t4t:0.4.2": get
#import "@local/mythographer-5e:0.0.1": transl

#let process-spells(body) = {
  if not body.keys().contains("spellcasting") { return }
  if body.spellcasting == none { return }

  // name:
  // type:
  // // headerEntrie

  let spellcasting = body.spellcasting

  let spells = ()
  if type(spellcasting) == array {
    for spell-block in spellcasting {
      // if spell-block.keys().contains("spells") and spell-block.spells == dictionary {}
    }
  }

  // if type(body.spellcasting) == array {
  //   return body
  //     .spellcasting
  //     .map(spell-block => {
  //       if spell-block.type == "spellcasting" {
  //         if type(spell-block.spells) == dictionary {
  //           spell-block
  //             .spells
  //             .pairs()
  //             .map(pair => {
  //               let name = pair.at(0)
  //               let values = pair.at(1)

  //               if name == "0" {
  //                 // Cantrips
  //                 [#strong(transl("cantrips", mode: str)): #values.spells.join(", ")]
  //               } else {
  //                 // slots
  //                 // spells
  //                 if values.keys().contains("slots") and values.slots != none {
  //                   let slots = values.slots
  //                   (
  //                     [#strong(transl("level", n: (name), mode: str)) (#slots #transl("slot", t: slots, mode: str)): #values.spells.join(", ")]
  //                   )
  //                 } else {
  //                   [#strong(transl("level", n: (name), mode: str)): #values.spells.join(", ")]
  //                 }
  //               }
  //             })
  //         } else {
  //           panic()
  //         }
  //       } else {
  //         panic("spell-block.type not implemented yet: ", spell-block.type)
  //       }
  //     })
  //     .join(linebreak())
  //     .join(linebreak())
  // }
  // panic("we shouldn't get here", type(body.spellcasting))
}
