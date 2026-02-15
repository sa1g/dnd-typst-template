part = Part

chapter = { $t ->
  *[sing] Chapter
   [plur] Chapters
   [short] Ch.
}

## Spell
casting-time = Casting Time
range = Range
component = { $t ->
  *[sing] Component
   [plur] Components
}
duration = Duration

## Feat
prerequisite = Prerequisite

###############################################
##### Monster

### Size
# F = Infinitesimale, D = Minuscola, T = Minuscola, S = Piccola, M = Media, L = Grande, H = Enorme, G = Mastodontica, C = Colossale, V = Variabile
msize =
    { $msize ->
         [F]
            { $type ->
               [aberration] Infinitesimale
               [beast] Infinitesimale
               [celestial] Infinitesimale
               [construct] Infinitesimale
               [dragon] Infinitesimale
               [elemental] Infinitesimale
               [fey] Infinitesimale
               [fiend] Infinitesimale
               [giant] Infinitesimale
               [humanoid] Infinitesimale
               [monstrosity] Infinitesimale
               [ooze] Infinitesimale
               [plant] Infinitesimale
               [undead] Infinitesimale
               *[other] Infinitesimale
            }
         [D]
            { $type ->
               [aberration] Minuscola
               [beast] Minuscola
               [celestial] Minuscolo
               [construct] Minuscolo
               [dragon] Minuscolo
               [elemental] Minuscolo
               [fey] Minuscolo
               [fiend] Minuscolo
               [giant] Minuscolo
               [humanoid] Minuscolo
               [monstrosity] Minuscola
               [ooze] Minuscola
               [plant] Minuscola
               [undead] Minuscolo
               *[other] Minuscolo
            }
         [T]
            { $type ->
               [aberration] Minuscola
               [beast] Minuscola
               [celestial] Minuscolo
               [construct] Minuscolo
               [dragon] Minuscolo
               [elemental] Minuscolo
               [fey] Minuscolo
               [fiend] Minuscolo
               [giant] Minuscolo
               [humanoid] Minuscolo
               [monstrosity] Minuscola
               [ooze] Minuscola
               [plant] Minuscola
               [undead] Minuscolo
               *[other] Minuscolo
            }
         [S]
            { $type ->
               [aberration] Piccola
               [beast] Piccola
               [celestial] Piccolo
               [construct] Piccolo
               [dragon] Piccolo
               [elemental] Piccolo
               [fey] Piccolo
               [fiend] Piccolo
               [giant] Piccolo
               [humanoid] Piccolo
               [monstrosity] Piccola
               [ooze] Piccola
               [plant] Piccola
               [undead] Piccolo
               *[other] Piccolo
            }
         [M]
            { $type ->
               [aberration] Media
               [beast] Media
               [celestial] Medio
               [construct] Medio
               [dragon] Medio
               [elemental] Medio
               [fey] Medio
               [fiend] Medio
               [giant] Medio
               [humanoid] Medio
               [monstrosity] Media
               [ooze] Media
               [plant] Media
               [undead] Medio
               *[other] Medio
            }
         [L]
            { $type ->
               [aberration] Grande
               [beast] Grande
               [celestial] Grande
               [construct] Grande
               [dragon] Grande
               [elemental] Grande
               [fey] Grande
               [fiend] Grande
               [giant] Grande
               [humanoid] Grande
               [monstrosity] Grande
               [ooze] Grande 
               [plant] Grande
               [undead] Grande
               *[other] Grande
            }
         [H]
            { $type ->
               [aberration] Enorme
               [beast] Enorme
               [celestial] Enorme
               [construct] Enorme
               [dragon] Enorme
               [elemental] Enorme
               [fey] Enorme
               [fiend] Enorme
               [giant] Enorme
               [humanoid] Enorme
               [monstrosity] Enorme
               [ooze] Enorme
               [plant] Enorme
               [undead] Enorme
               *[other] Enorme
            }
         [G]
            { $type ->
               [aberration] Mastodontica
               [beast] Mastodontica
               [celestial] Mastodontico
               [construct] Mastodontico
               [dragon] Mastodontico
               [elemental] Mastodontico
               [fey] Mastodontico
               [fiend] Mastodontico
               [giant] Mastodontico
               [humanoid] Mastodontico
               [monstrosity] Mastodontica
               [ooze] Mastodontica
               [plant] Mastodontica
               [undead] Mastodontico
               *[other] Mastodontico
            }
         [C]
            { $type ->
               [aberration] Colossale
               [beast] Colossale
               [celestial] Colossale
               [construct] Colossale
               [dragon] Colossale
               [elemental] Colossale
               [fey] Colossale
               [fiend] Colossale
               [giant] Colossale
               [humanoid] Colossale
               [monstrosity] Colossale
               [ooze] Colossale
               [plant] Colossale
               [undead] Colossale
               *[other] Colossale
            }  
         [V]
            { $type ->
               [aberration] Variabile
               [beast] Variabile
               [celestial] Variabile
               [construct] Variabile
               [dragon] Variabile
               [elemental] Variabile
               [fey] Variabile
               [fiend] Variabile
               [giant] Variabile
               [humanoid] Variabile
               [monstrosity] Variabile
               [ooze] Variabile
               [plant] Variabile
               [undead] Variabile
               *[other] Variabile
            }
       *[other] Sconosciuta
    }



### type
mtype =
    { $mtype ->
         [aberration] Aberrazione
         [beast] Bestia
         [celestial] Celestiale
         [construct] Costrutto
         [dragon] Drago
         [elemental] Elementale
         [fey] Fatato
         [fiend] Demone
         [giant] Gigante
         [humanoid] Umanoide
         [monstrosity] Mostruosità
         [ooze] Melma
         [plant] Pianta
         [undead] Non Morto
         *[other] Creatura
    }

creature-description =
     { mtype } { msize }

### Alignment
L = Lawful
N = Neutral
NX = Neutral
NY = Neutral
C = Chaotic
G = Good
E = Evil
U = Unaligned
A = Any Alignment

LNXCNYE = Any Non-Good Alignment
LNXCNYG = Any Good Alignment


### Speed
stype = 
   { $stype ->
      [walk] walk
      [burrow] burrow
      [climb] climb
      [fly] fly
      [swim] swim
      *[other] unknown
   }


# Misc
dc = DC
armor-class = Armor Class
hit-points = Hit Points
speed = Speed






### Abilities
str = { $t ->
   *[short] str
   [long] strength
}
dex = { $t ->
   *[short] dex
   [long] dexterity
}
con = { $t ->
   *[short] con
   [long] constitution
}
int = { $t ->
   *[short] int
   [long] intelligence
}
wis = { $t ->
   *[short] wis
   [long] wisdom
}
cha = { $t ->
   *[short] cha
   [long] charisma
}

### Attacks
ms = Melee Spell Attack
rs = Ranged Spell Attack
mw = Melee Weapon Attack
rw = Ranged Weapon Attack
saving-throw = { $t ->
  *[sing] Saving Throw
   [plur] Saving Throws
}
skill = { $t ->
  *[sing] Skill
   [plur] Skills
   [acrobatics] acrobatics
   [animal] animal
   [arcana] arcana
   [athletics] athletics
   [deception] deception
   [history] history
   [insight] insight
   [intimidation] intimidation
   [investigation] investigation
   [medicine] medicine
   [nature] nature
   [perception] perception
   [performance] performance
   [persuasion] persuasion
   [religion] religion
   [sleightofhand] sleight of hand
   [stealth] stealth
   [survival] survival
}


senses = { $t ->
   *[sing] Sensi
   [plur] Sensi
   [blindsight] blindsight
   [darkvision] darkvision
   [tremorsense] tremorsense
   [truesight] truesight
   [passive] passive perception
}


languages = { $t ->
   *[sing] Language
   [plur] Languages
   [X] Any (Choose)
   [XX] All
   [CS] Can't Speak Known Languages
   [LF] Languages Known in Life
   [TP] Telepathy
   [OTH] Other
   [AB] Abyssal
   [AQ] Aquan
   [AU] Auran
   [C] Common
   [CE] Celestial
   [CSL] Common Sign Language
   [D] Dwarvish
   [DR] Draconic
   [DS] Deep Speech
   [DU] Druidic
   [E] Elvish
   [G] Gnomish
   [GI] Giant
   [GO] Goblin
   [GTH] Gith
   [H] Halfling
   [I] Infernal
   [IG] Ignan
   [O] Orc
   [P] Primordial
   [S] Sylvan
   [T] Terran
   [TC] Thieves' cant
   [U] Undercommon
}

damage-type = { $t ->
  [acid] acid
  [bludgeoning] bludgeoning
  [cold] cold
  [fire] fire
  [force] force
  [lightning] lightning
  [necrotic] necrotic
  [piercing] piercing
  [poison] poison
  [psychic] psychic
  [radiant] radiant
  [slashing] slashing
  [thunder] thunder
  *[other] other damage
}

damage-vulnerability = { $t ->
  *[sing] Damage Vulnerability
   [plur] Damage Vulnerabilities
}

resist = { $t ->
  *[sing] Damage Resistance
   [plur] Damage Resistances
} 

immune = { $t ->
   *[sing] Damage Immunity
    [plur] Damage Immunities
}

data-condition = { $t -> 
   [blinded] blinded
   [charmed] charmed 
   [deafened] deafened 
   [exhaustion] exhaustion 
   [frightened] frightened 
   [grappled] grappled 
   [incapacitated] incapacitated 
   [invisible] invisible 
   [paralyzed] paralyzed 
   [petrified] petrified 
   [poisoned] poisoned 
   [prone] prone 
   [restrained] restrained 
   [stunned] stunned 
   [unconscious] unconscious 
   [disease] disease
   *[other] other condition
} 

conditionImmune = { $t ->
  *[sing] Condition Immunity
   [plur] Condition Immunities
}

in-lair = {$t ->
   *[other] or $t XP in lair 
}
xp = XP
cr = Challenge Rating
proficiency-bonus = Proficiency Bonus


## Actions
actions = Actions
attack = Attack
to-hit = to hit
hit = hit
or = or
when = when

## Innate
innate-spellcasting = Innate Spellcasting
at-will = At will
day-each = day each
day = Day

## Spellcasting
spellcasting = Spellcasting
cantrips = Cantrips (at will)

slot = { $t ->
  *[sing] slot
   [plur] slots
}

level = { $n ->
    [1] { $n }st level
    [2] { $n }nd level
    [3] { $n }rd level
   *[other] { $n }th level
}


## Bonus Action
bonus-actions = Bonus Actions

## Legendary Action
legendary-actions = Legendary Actions