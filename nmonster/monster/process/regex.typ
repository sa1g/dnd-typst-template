#import "@local/mythographer-5e:0.0.1": transl

#import "../../utils.typ"

#import "@preview/t4t:0.4.2": get

#let regex-5etools-tags(body) = {
  let body = body
  // DC
  body = str.replace(body, regex("\{@dc\s+(\d+)\}"), match => {
    get.text[#transl("dc", mode: str) #match.text.find(regex("\d+"))]
  })

  // HIT
  body = str.replace(body, regex("\{@hit\s+(\d+)\}"), match => {
    get.text[+ #match.text.find(regex("\d+"))]
  })
  // @h (hit:)
  body = str.replace(body, regex("\{@h\}"), match => {
    get.text[#transl("hit", mode: str): ]
  })

  // ATK - mw: melee weapon, rw: ranged weapon, ms: melee spell, rs: ranged spell
  body = str.replace(body, regex("\{@atk [^}]+}"), match => {
    get.text[#transl(match.text.trim("{@atk ").trim("}"), mode: str)]
  })

  // DICE
  body = str.replace(body, regex("(?:\d+\s*\()?\{@dice\s+([^}]+)\}\)?"), match => {
    get.text(utils.dnd-dice(match.text.find(regex("\d+d\d+\s*(?:\+\s*\d+)?"))))
  })

  // DAMAGE
  body = str.replace(body, regex("(?:\d+\s*\()?\{@damage\s+([^}]+)\}\)?"), match => {
    get.text(utils.dnd-dice(match.text.find(regex("\d+d\d+\s*(?:\+\s*\d+)?"))))
  })

  // SPELLS {@spell <name>}
  body = str.replace(body, regex("\{@spell [^}]+}"), match => {
    get.text[#match.text.trim("{@spell ").trim("}")]
  })

  // ITEM {@item <name>} or {@item <name>|<reference>} )
  body = str.replace(body, regex("\{@item [^|}]+(?:|[^}]+)?}"), match => {
    // get.text[#match.text.trim("{@spell ").trim("}")]
    get.text[#match.text.trim("{@item ").trim("}").split("|").at(0)]
  })

  // CONDITION {@condition <name>}
  body = str.replace(body, regex("\{@condition [^}]+}"), match => {
    get.text[#match.text.trim("{@condition ").trim("}")]
  })

  return body
}
