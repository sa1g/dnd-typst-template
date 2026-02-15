// This monster visualizer is compatible with 5etools schema (official). It support some "homebrew" 
// setups provided by 5etools, but these haven't been tested (15/02/2026 - Sa1g).
// 
// 
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema-template/bestiary/bestiary.json
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema-template/util.json
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema-template/entry.json
#import "@local/mythographer-5e:0.0.1":fn-wrapper, merge-dicts
#import "monster/5e2014.typ": monster-5e


// #let balance1(fill: none, n-cols: 2, content) = layout(size => {
//   let cols-to-pec = ("1": 100%, "2": 50%, "3": 33%, "4": 25%)
//   // let textheight = measure(content, width: size.width).height
//   let textheight =( measure(content, width: size.width/n-cols).height)

//   textheight = (textheight + 0.16*textheight) / n-cols
//   // let height = measure(content, height: textheight + 9pt, width: size.width).height 

//   // return [#textheight, #height]

//   block(
//     // height: height + 1em,
//     height: textheight,
//     fill: fill,
//     width: 100%,
//     inset: 1em,
//     above: 1em,
//     below: 1em,
//   )[#columns(n-cols)[#content]]
// })




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
