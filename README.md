# qb-notepad

## Pictures
![](https://cdn.izmystic.gay/images/zkp7g97q.png)

## Install
Add resource to `[qb]` folder \
Add image to `qb-inventory/html/images` \
Add below code into `qb-core/shared.lua`
```lua
['notepad'] = {['name'] = 'notepad', ['label'] = 'Notepad', ['weight'] = 3, ['type'] = 'item', ['image'] = 'notepad.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A peice of paper to write things down on'},
```