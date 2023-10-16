////Take fixed amulet and replace with Amulet of Ages

#include "NW_I0_Plot"

void main()

{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M3Q3C_FIXEDAGES");

    if (GetIsObjectValid(oItem))
        ActionTakeItem( oItem, GetPCSpeaker());

    CreateItemOnObject( "M3Q3C_SWORDAGES", GetPCSpeaker());

    ///////add in flashy effect
        ///////add in flashy effect
    effect eVis = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
}
