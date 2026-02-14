#let dnd-dice-average(amount, die) = {
  let average = int(amount * (die / 2 + 0.5))
  return average
}

/// Calculates the average of the given dice expression and returns a text with the average and the original expression, e.g. "13 (3d8 + 3)".
///
/// - body: Dice formatted as either:
///       - [3d8]
///       - [3d8+3]
///       - [3d8 + 3]
///       - the same as strings, e.g. "3d8", "3d8+3", "3d8 + 3"
///
/// -> e.g. [16 (3d8 + 3)] or [13 (3d8)] or none if the expression is invalid or somehow the assertion fails.
#let dnd-dice(body) = {
  assert(type(body) == str or body.has("children") or body.has("text"))

  // Case "3d8" and "3d8+3"
  if type(body) == str {
    // panic()

    let d-form = ""
    let modifier = 0
    if body.contains("+") {
      let parts = body.split(regex("[+]"))
      d-form = parts.at(0).trim()
      modifier = int(parts.at(1).trim())
    } else {
      d-form = body.trim()
    }
    let amount-dice = d-form.split(regex("[d]")).map(int)
    let average = dnd-dice-average(amount-dice.at(0), amount-dice.at(1))
    let hp-no-sum = average + modifier

    return [#hp-no-sum (#body)]
  }

  // Case [3d8]
  if body.has("text") {
    if body.text.contains("+") {
      let parts = body.text.split(regex("[+]")).map(str.trim)
      let amount-dice = parts.at(0).split(regex("[d]")).map(int)
      let average = dnd-dice-average(amount-dice.at(0), amount-dice.at(1))
      let modifier = int(parts.at(1))
      let hp-no-sum = average + modifier
      return [#hp-no-sum (#body)]
    } else {
      let amount-dice = body.text.split(regex("[d]")).map(int)
      let average = dnd-dice-average(amount-dice.at(0), amount-dice.at(1))
      return [#average (#body)]
    }
  }

  // Case [3d8 + 3]
  if body.has("children") {
    let amount-dice = (body.children.at(0).text).split(regex("[d]")).map(int)
    let average = dnd-dice-average(amount-dice.at(0), amount-dice.at(1))
    let modifier = int(body.children.at(body.children.len() - 1).text)
    let hp-no-sum = average + modifier
    return [#average (#body)]
  }

  return none
}