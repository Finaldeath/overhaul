//::///////////////////////////////////////////////
//:: Name q2_ent_plot4trg1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Plot Check - After 4 plots have been completed - if the PC
    enters the city - Ossyr will talk to the PC and
    they will jumped to the Seer to start the siege..
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Oct 10/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Chapter2Plots_Done") == 4 || GetLocalInt(GetModule(), "X2_Chapter2Plots_Done") == 5)
    {

        object oPC = GetEnteringObject();
        if (GetIsDM(oPC) == TRUE)
            return;
        if (GetIsPC(oPC) == FALSE)
            return;

        SetLocalInt(GetModule(), "X2_Chapter2Plots_Done", 6);
        object oSergeant = GetObjectByTag("q2a_prebat_sgt");
        AssignCommand(oPC, ClearAllActions(TRUE));
        SetCutsceneMode(oPC, TRUE);
        AssignCommand(oPC, ActionMoveToObject(oSergeant, FALSE, 2.0));
        AssignCommand(oSergeant, ActionStartConversation(oPC));
    }
}
