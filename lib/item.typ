#import "config.typ"
#import "core.typ"
#import "utils.typ"

#let dnd-item(config: (:), body) = core.fn-wrapper(self => context {
  if config != (:) {
    self = utils.merge-dicts(self, config)
  }

  set heading(outlined: false)

  show heading.where(level: 1): it => {
    set text(
      weight: self.item.headers.level-1.weight,
      font: self.item.headers.level-1.font,
      size: self.item.headers.level-1.size,
      fill: self.item.headers.level-1.fill,
    )
    utils.call-if-fn(self.item.headers.level-1.style, [#it.body])
    linebreak()
  }


  show heading.where(level: 2): it => {
    set text(
      weight: self.item.headers.level-2.weight,
      font: self.item.headers.level-2.font,
      size: self.item.headers.level-2.size,
    )
    utils.call-if-fn(self.item.headers.level-2.style, [#it.body])
  }

  set text(
    font: self.item.body.font,
    size: self.item.body.size,
    fill: self.item.body.fill,
  )

  let current = counter(heading).get()
  counter(heading).update(0)
  body
  counter(heading).update(current)
})
