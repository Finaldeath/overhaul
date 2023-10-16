//::///////////////////////////////////////////////
//:: Name hx_handdm_abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Abort script for demon.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    location lLoc = GetLocation(oPC);
    object oDemon = GetObjectByTag("hx_hand_demon");

    SetLocalInt(GetModule(), "HX_DEMON_ABORTED", FALSE);

    // If not here, spawn.
    if(!GetIsObjectValid(oDemon))
    {
        oDemon = CreateObject(OBJECT_TYPE_CREATURE, "hx_hand_demon", lLoc);
    }

    DelayCommand(2.0, ChangeToStandardFaction(oDemon, STANDARD_FACTION_HOSTILE));
    DelayCommand(2.5, AssignCommand(oDemon, ActionAttack(oPC)));
}
