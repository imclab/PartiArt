FW.Spells = class Spells
  constructor: ->
    @spells = []
    @activeSpellIndex = 0
    #LIGHT WAND
    @spells.push new FW.Wand()
    #FIRE
    @spells.push new FW.Fire()
    #BUBBLES
    @spells.push new FW.Bubbles()
    #WORMHOLE
    @spells.push new FW.Fireflies()

    FW.spellHistory = []

    $('body')[0].on 'mousedown', (event)=>
      @spells[@activeSpellIndex].castSpell()
    $('body')[0].on 'mouseup', =>
      @spells[@activeSpellIndex].endSpell()

  update:->
    # @spells[@activeSpellIndex].update()
    for spell in @spells
      spell.update()


  nextSpell: ->
    #make sure we end spell if user had been holding mouse down when he switched to a new one
    @spells[@activeSpellIndex].endSpell()


    @activeSpellIndex++
    if @activeSpellIndex is @spells.length
      @activeSpellIndex = 0

    elements = document.getElementsByClassName('spell')
    for element in elements
      if element.id is @spells[@activeSpellIndex].name
        element.className = 'spell show-class'
      else
        element.className = 'spell hide-class'




