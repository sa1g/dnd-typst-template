// 14/02/2026
// https://github.com/TheGiddyLimit/5etools-utils/blob/master/schema/site/bestiary/bestiary.json
// Possible `name` data entries are as follows:
//
// string

#import "@local/mythographer-5e:0.0.1": call-if-fn

#let render-name(self, body) = [
  #assert(body.keys().contains("name"))
  #text(
    size: self.font.monster.title.size,
    weight: self.font.monster.title.weight,
    font: self.font.monster.title.font,
    fill: self.fill.monster.title,
    call-if-fn(self.font.monster.title.style, body.name),
  )
]
