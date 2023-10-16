//::///////////////////////////////////////////////
//:: Name hx_handdm_attack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The demon attacks.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oDemon = GetObjectByTag("hx_hand_demon");

    SetLocalInt(GetModule(), "HX_DEMON_ABORTED", FALSE);

    ChangeToStandardFaction(oDemon, STANDARD_FACTION_HOSTILE);
    AssignCommand(oDemon, ActionAttack(oPC));
}
