//::///////////////////////////////////////////////
//:: Name q2a_entbatcut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start the 'Arrival of the Matron's army' cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 18/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    if (GetLocalInt(OBJECT_SELF, "nCutsceneTriggered") == 1)
    {
        //Send any further PCs back out of this area
        object oTarget = GetWaypointByTag("mn_q2abat1_battlestart");
        AssignCommand(oPC, JumpToObject(oTarget));
        return;
    }
    //Set a global that the matron's attack is here (for herald's conversation)
    SetLocalInt(GetModule(), "Q2A1_Herald_Conversation", 1);
    SetLocalInt(OBJECT_SELF, "nCutsceneTriggered", 1);
    ExecuteScript("cut_battle1_101", oPC);
}
