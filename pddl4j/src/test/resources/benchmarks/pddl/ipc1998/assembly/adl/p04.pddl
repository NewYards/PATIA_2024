(define (problem assem-x-4)
   (:domain assembly)
   (:objects frob connector socket-1 contraption-2 coil whatsis
             bracket hoozawhatsie thingumbob contraption unit hack widget
             sprocket device tube doodad fastener plug gimcrack socket valve
             mount wire kludge - assembly
             voltmeter hammock charger - resource)
   (:init (available socket-1)
          (available contraption-2)
          (available coil)
          (available whatsis)
          (available bracket)
          (available thingumbob)
          (available contraption)
          (available unit)
          (available widget)
          (available sprocket)
          (available device)
          (available tube)
          (available doodad)
          (available fastener)
          (available gimcrack)
          (available socket)
          (available mount)
          (available wire)
          (available kludge)
          (available voltmeter)
          (available hammock)
          (available charger)
          (requires connector hammock)
          (requires hoozawhatsie hammock)
          (requires hack charger)
          (requires plug voltmeter)
          (requires valve hammock)
          (part-of connector frob)
          (part-of hoozawhatsie frob)
          (part-of hack frob)
          (part-of plug frob)
          (part-of socket-1 connector)
          (part-of contraption-2 connector)
          (part-of coil connector)
          (part-of valve connector)
          (part-of whatsis connector)
          (part-of bracket connector)
          (part-of thingumbob hoozawhatsie)
          (part-of contraption hoozawhatsie)
          (part-of unit hoozawhatsie)
          (part-of widget hack)
          (part-of sprocket hack)
          (part-of device hack)
          (part-of tube hack)
          (part-of doodad hack)
          (part-of fastener hack)
          (part-of gimcrack plug)
          (part-of socket plug)
          (transient-part valve plug)
          (part-of mount valve)
          (part-of wire valve)
          (part-of kludge valve)
          (assemble-order connector hoozawhatsie frob)
          (assemble-order hoozawhatsie hack frob)
          (assemble-order plug hack frob)
          (assemble-order valve gimcrack connector)
          (assemble-order whatsis contraption-2 connector)
          (assemble-order bracket valve connector)
          (assemble-order thingumbob contraption hoozawhatsie)
          (assemble-order unit contraption hoozawhatsie)
          (assemble-order device fastener hack)
          (assemble-order tube doodad hack)
          (assemble-order valve gimcrack plug)
          (remove-order gimcrack valve plug)
          (assemble-order mount kludge valve)
          (assemble-order kludge wire valve))
   (:goal (complete frob)))