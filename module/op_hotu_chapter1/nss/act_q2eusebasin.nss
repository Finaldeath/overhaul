//::///////////////////////////////////////////////
//:: Name: act_q2eusebasin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
When used, this basin will initiate dialogue,
describing the elven runes the basin is covered in and
how it seems to be full of a green light.
Whenever a plant (or part of a plant) is placed within,
it "grows" to its full age. The plant can then be selected
and its fruit taken… at which point the plant disappears.
By placing the ancient oak branch within the basin,
an oak tree appears… and allows the PC to take the acorn
which will restore the dryad head.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_GREATER), GetLocation(OBJECT_SELF));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HOLY_AID), GetLocation(GetWaypointByTag("wp_q2e_oaktree")));
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2eoaktree", GetLocation(GetWaypointByTag("wp_q2e_oaktree")));
}
