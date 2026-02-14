// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema-template/bestiary/bestiary.json
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema-template/util.json
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema-template/entry.json
#import "@local/mythographer-5e:0.0.1": call-if-fn, fn-wrapper, merge-dicts, transl
#import "@preview/t4t:0.4.2": get // use get.text[stuff]

#import "utils.typ"
#import "monster/5e2014.typ": monster-5e



#let dnd-monster(config: (:), body) = fn-wrapper(self => {
  if config != (:) {
    self = merge-dicts(self, config)
  }

  // Get shortName (get or compile)

  block(
    // height: height + 1em,
    fill: color.transparentize((self.fill.monster.background), self.fill.monster.transparency),
    width: 100%,
    inset: 1em,
    above: 1em,
    below: 1em,
  )[
    #columns()[
      #monster-5e(config, body)

    ]
  ]
})
