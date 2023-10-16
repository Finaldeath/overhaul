//::///////////////////////////////////////////////
//:: Name act_q2adream_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is teleported back to Lith My'athar
    and the siege should start
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

void main()
{
    //if this is post siege - do nothing
    if (GetLocalInt(GetModule(), "X2_Q2ABattleSeerDead") > 0)
        return;

    object oPC = GetPCSpeaker();
    //Variable for Save/Load check
    SetLocalInt(oPC, "nTalkingToDreamMatron", 0);

    object oTarget = GetWaypointByTag("mn_q2abat1_battlestart");

    AssignCommand(oPC, JumpToObject(oTarget));

    //Get rid of the Invisibility effect any henchmen would have had on them.

    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(GetIsObjectValid(oHench) == TRUE)
    {
        eVis = GetFirstEffect(oHench);
        while (GetIsEffectValid(eVis) == TRUE)
        {
            RemoveEffect(oHench, eVis);
            eVis = GetNextEffect(oHench);
        }
        i++;
        oHench = GetHenchman(oPC, i);
    }




    DelayCommand(3.0, ExecuteScript("q2a_startbattle1", oPC));
}
