//::///////////////////////////////////////////////
//:: M2Q2G_RETURN.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the Player to the NeverWinterWoods
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 19, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(GetModule(),"NW_2Q2_SPIRITFINISHEDGOOD",99);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL),GetLocation(oPC));
    DelayCommand(1.0,AssignCommand(oPC,JumpToLocation(GetLocation(GetWaypointByTag("WP_M2Q2F2SPIRIT")))));
}
