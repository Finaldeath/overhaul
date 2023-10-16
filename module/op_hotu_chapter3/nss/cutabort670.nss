//::///////////////////////////////////////////////
//:: Name cutabort205
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Scrivener cutscene abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 9, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oScriv = GetObjectByTag("H2_Scrivener");
    location lPCStart = GetLocation(GetNearestObjectByTag("hx_scriv_pc_start_wp", oPC));
    location lScriv = GetLocation(GetNearestObjectByTag("hx_scriv_end_wp", oPC));
    object oVFX = GetObjectByTag("AribethDoorVFX000");

    BlackScreen(oPC);
    DestroyObject(oVFX);
    AssignCommand(oPC, ActionJumpToLocation(lPCStart));
    AssignCommand(oScriv, ActionJumpToLocation(lScriv));
    DelayCommand(0.5, AssignCommand(oScriv, ActionStartConversation(oPC)));
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
}
