// Web used: destroy the web

void main()
{
    object oPC = GetLastUsedBy();
    if(GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC)) == "NW_IT_TORCH001") // holding a torch
    {
        effect eVis = EffectVisualEffect(498);
        object oInv = CreateObject(OBJECT_TYPE_PLACEABLE, "q5c_flame_source", GetLocation(OBJECT_SELF));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oInv, 5.0);

    }
    DestroyObject(OBJECT_SELF, 1.0);
}
