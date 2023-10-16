//::///////////////////////////////////////////////
//:: Entered
//:: M2Q3KA_Summon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Summons a Mummy Lord.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 15, 2002
//:://////////////////////////////////////////////

void CreateMummy(object oWaypoint)
{
    CreateObject(OBJECT_TYPE_CREATURE,"NW_MUMMYBOSS",GetLocation(oWaypoint));
}

void main()
{
    object oWaypoint = GetObjectByTag("WP_M2Q3KA");
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered) && GetLocalInt(OBJECT_SELF,"NW_L_Spawn") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Spawn",1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL_GREATER),oWaypoint);
        DelayCommand(1.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_IMPLOSION),oWaypoint));
        DelayCommand(4.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),oWaypoint));
        DelayCommand(4.5,ActionDoCommand(CreateMummy(oWaypoint)));
    }
}
