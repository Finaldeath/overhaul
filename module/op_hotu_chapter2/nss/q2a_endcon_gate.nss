//::///////////////////////////////////////////////
//:: Name q2a_endcon_gate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump to the Seer and get ready to start the siege
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct 10/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Chapter2Plots_Done") == 6)
    {
        object oPC = GetPCSpeaker();
        object oTarget = GetWaypointByTag("wp_cut102_pcstart");
        AssignCommand(oPC, JumpToObject(oTarget));
    }
}
