//::///////////////////////////////////////////////
//:: Vote Started
//:: cac_km_guildvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start the Election through Mykes Dialog.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oAlias = GetObjectByTag("q2_alias");
    object oBeck = GetObjectByTag("q2_sirbecket");
    object oLamp = GetObjectByTag("q2_lamplighter");
    object oEnivid = GetObjectByTag("q2_enivid");

    object oWay = GetObjectByTag("q2c25_way_beccas");
    object oWay1 = GetObjectByTag("q2c25_way_alias");
    object oWay2 = GetObjectByTag("q2_way_pcvote");
    object oWay3 = GetObjectByTag("vt_way_enivid");

    BlackScreen(oPC);
    SetCutsceneMode(oPC, TRUE);

    SetLocalInt(oPC,"OS_START_VOTE",10);

    // Put every one in position and start the dialog
    AssignCommand(oBeck,ActionJumpToObject(oWay));
    AssignCommand(oAlias,ActionJumpToObject(oWay1));
    AssignCommand(oPC,ActionJumpToObject(oWay2));
    AssignCommand(oEnivid, ActionJumpToObject(oWay3));

    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oLamp, ActionStartConversation(oPC));

    DelayCommand(1.0f, AssignCommand(oPC, SetCameraFacing(225.0f, 12.0f, 70.0f)));
    DelayCommand(1.5f, FadeFromBlack(oPC));
}
