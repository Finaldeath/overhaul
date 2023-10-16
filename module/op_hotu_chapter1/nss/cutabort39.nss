//::///////////////////////////////////////////////
//:: Name cutabort39
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort script for Cutscene 39 - Undermountain
    Level 2 entry scene (4 chains)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 10/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    // Cutscene actors and objects.

    BlackScreen(oPC);
    object oAssistant = GetObjectByTag("cut39_assistant");
    object oDrow1 = GetObjectByTag("cut39_drow1");
    object oDrow2 = GetObjectByTag("cut39_drow2");
    object oDrow3 = GetObjectByTag("cut39_drow3");

    object oDoor = GetObjectByTag("q2c03_door");
    object oChain1 = GetObjectByTag("cut39_chain1");
    object oChain2 = GetObjectByTag("cut39_chain2");
    object oChain3 = GetObjectByTag("cut39_chain3");
    object oChain4 = GetObjectByTag("cut39_chain4");

    location lDrow1 = GetLocation(GetWaypointByTag("wp_cut39_drow_1"));
    location lDrow2 = GetLocation(GetWaypointByTag("wp_cut39_drow_2"));
    location lDrow3 = GetLocation(GetWaypointByTag("wp_cut39_drow_3"));
    location lAssistant3 = GetLocation(GetWaypointByTag("wp_cut39_assistant_3"));
    location lPC = GetLocation(GetWaypointByTag("wp_q2ccut39_copystart"));

    AssignCommand(oPC, JumpToLocation(lPC));
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FAST));

    AssignCommand(oDoor, ActionCloseDoor(oDoor));

    SetLocked(oDoor, TRUE);

    AssignCommand(oAssistant, ActionJumpToLocation(lAssistant3));

    if (GetIsObjectValid(oDrow2) == TRUE)
        DestroyObject(oDrow2);
    if (GetIsObjectValid(oChain1) == TRUE)
        DestroyObject(oChain1);
    if (GetIsObjectValid(oChain2) == TRUE)
        DestroyObject(oChain2);
    if (GetIsObjectValid(oChain3) == TRUE)
        DestroyObject(oChain3);
    if (GetIsObjectValid(oChain4) == TRUE)
        DestroyObject(oChain4);

    ChangeToStandardFaction(oDrow1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDrow3, STANDARD_FACTION_HOSTILE);
    AssignCommand(oDrow1, ActionJumpToLocation(lDrow1));
    AssignCommand(oDrow3, ActionJumpToLocation(lDrow3));
    DelayCommand(3.0, AssignCommand(oDrow1, ActionAttack(oDoor)));
    DelayCommand(3.0, AssignCommand(oDrow3, ActionAttack(oDoor)));
}
