#import "@local/mythographer-5e:0.0.1": (
  call-if-fn, config-colors, config-page, default-config, dnd-template, merge-dicts, transl,
)

#import "monster.typ": dnd-monster

#let config = merge-dicts(
  default-config,
  config-page(
    show-chapter: false,
    show-part: false,
    lang: "it",
  ),
  config-colors(monster-background: rgb("#19cbb0")),
)

#show: dnd-template.with(config)

#let unicorn = json("tmp_json/unicorn.json")
#let unicorn = json("tmp_json/acererak.json")
// #let unicorn = json("tmp_json/blackguard.json")
// #let unicorn = json("tmp_json/frost.json")
// #let unicorn = json("tmp_json/adult-blue.json")
// #let unicorn = json("tmp_json/abissal.json") // resistance, immunity
// #let unicorn = json("tmp_json/antilon.json") // senses 
// #let unicorn = json("tmp_json/air-elemental.json") // senses // resistances
// #let unicorn = json("tmp_json/mummy-lord.json") // 
// #let unicorn = json("tmp_json/undead-swarm.json") // 
// #let unicorn = json("tmp_json/yuanti.json") // 
// #let unicorn = json("tmp_json/ras.json") // 
// #let unicorn = json("tmp_json/ki.json")




#dnd-monster(config: config, unicorn)

#unicorn