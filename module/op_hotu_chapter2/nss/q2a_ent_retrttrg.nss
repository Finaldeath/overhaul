//::///////////////////////////////////////////////
//:: Name q2a_ent_retrttrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy retreating troops during phase 1 of the siege
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 30/03
//:://////////////////////////////////////////////

void main()
{
    object oCreature = GetEnteringObject();
    if (GetIsPC(oCreature) == TRUE)
        return;

    if (GetLocalInt(oCreature, "nRetreat") == 1)
        DestroyObject(oCreature);
}
