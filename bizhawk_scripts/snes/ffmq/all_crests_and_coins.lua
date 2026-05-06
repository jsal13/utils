---@type table
local memory_maps = {{
    --[[
        Crests + Coins address is at 0x000EA7.
        The system is a bit weird, but increasing the value of this byte 
        will give different combinations of crests.  A value of FF will 
        give all crests.
    ]]
    name = "All Crests and Coins.",
    address = '0x000EA7',
    patch_value = '0xFF',
    notes = [[You will have to reload the item list or use an item before you can see the effect.]]
}}

--[[
    Loop over all of the values in the table above,
    log the previous value for the user and set the new
    patch values.
]]

for _, mapping in ipairs(memory_maps) do
    local name = mapping.name
    local address_str = mapping.address
    local patch_value_str = mapping.patch_value
    local notes = mapping.notes

    local address = tonumber(address_str)
    local patch_value = tonumber(patch_value_str)

    local previous_value = memory.readbyte(address)
    local previous_value_str = string.format("%X", previous_value)

    console.log('\n--------------------')
    console.log('Patch: ' .. name)
    console.log('Address: ' .. address_str)
    console.log('Previous value: ' .. previous_value_str)

    -- Patch the value.
    memory.writebyte(address, patch_value)

    console.log('Current value: ' .. patch_value_str .. '.')
    console.log('NOTE: ' .. notes)
end