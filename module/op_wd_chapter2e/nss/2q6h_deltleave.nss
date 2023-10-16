//::///////////////////////////////////////////////
//:: Deltagar Leave
//:: 2Q6H_DeltLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Deltagar teleports away.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 1, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDelt = GetEnteringObject();
    object oWay = GetWaypointByTag("NW_EXIT");
    if(GetIsObjectValid(oDelt) && GetTag(oDelt) == "2Q6H_Deltagar")
    {
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
    }
}
