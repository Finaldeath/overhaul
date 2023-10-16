////Take broken amulet and replace with fixed amulet

#include "NW_I0_Plot"

void main()

{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M3Q3C_BROKENAGES");

    if (GetIsObjectValid(oItem))
        ActionTakeItem( oItem, GetPCSpeaker());

    CreateItemOnObject( "M3Q3C_FIXEDAGES", GetPCSpeaker());

    ///////add in flashy effect
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
}

