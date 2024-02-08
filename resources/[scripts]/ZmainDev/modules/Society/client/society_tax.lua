RegisterNetEvent('zmain:society:gouvernement:editTax', function(societyName, tax)
    Society.List[societyName].tax = tax
end)