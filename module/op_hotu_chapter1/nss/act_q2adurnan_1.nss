//::///////////////////////////////////////////////
//:: Name act_q2adurnan_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Durnan will put away his sword and PCs are now
    able to enter Undermountain.
    Have Deekin and White Thesta come down to the well room.
    UPDATE - actually lets only have Deekin so Thesta can
    finish healing everyone upstairs first..

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////

// * if player returning from basement, auto res all
// * dead character upstairs and force
// * White Thesta downstairs
// * She needs to be down here for her store to work.
void RaiseAll();

void main()
{        RaiseAll();
    object oPC = GetPCSpeaker();
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    object oThesta = GetObjectByTag("White");
    object oWellJump = GetWaypointByTag("mn_q2awellroom");
    object oWPDeekin = GetWaypointByTag("wp_q2awell_deekin");
    object oWPThesta = GetWaypointByTag("wp_q2awell_thesta");

    //Move Deekin to the well room
    if (GetMaster(oDeekin) == OBJECT_INVALID)
    {
        AssignCommand(oDeekin, ClearAllActions());
        AssignCommand(oDeekin, JumpToObject(oWellJump));
        DelayCommand(1.0, AssignCommand(oDeekin, ActionMoveToObject(oWPDeekin)));
    }
    object oWellRoom = GetWaypointByTag("wp_q2awell_thesta");
    SetAILevel(oThesta, AI_LEVEL_NORMAL);
    AssignCommand(oThesta, ClearAllActions(TRUE));
    AssignCommand(oThesta, ActionForceMoveToObject(oWellRoom, TRUE, 1.0, 5.0));
    DelayCommand(12.0, SetAILevel(oThesta, AI_LEVEL_DEFAULT));



    //DelayCommand(1.0, AssignCommand(oThesta, ActionMoveToObject(oWPThesta)));
    //Set variables so PC so that they can go down well
    //SetLocalInt(oPC, "nWellTalk", 1);
    SetLocalInt(GetModule(), "nWellTalk", 1);
    SetLocalInt(GetModule(),"RodRessurect",5);
    SetLocalInt(GetModule(), "DurnanSpoke", 4);
    SetLocalInt(GetModule(), "X2_Q2AWellRoomFight", 2);
    ActionPauseConversation();
    if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND)) == TRUE)
    {
        ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
    }
    DelayCommand(1.0, ActionResumeConversation());
}

// * if player returning from basement, auto res all
// * dead character upstairs and force
// * White Thesta downstairs
void RaiseAll()
{
    SetLocalInt(GetModule(), "X2_cut1_parleyD", 0);
    SetLocalInt(GetModule(), "X2_q2a_graybanD",0);
    SetLocalInt(GetModule(), "X2_cut1_glimD",0);
    SetLocalInt(GetModule(), "X2_q2amhaereD",0);
    SetLocalInt(GetModule(), "X2_cut1_lafontaineD",0);
    effect eRes = EffectResurrection();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, GetObjectByTag("q2a_grayban"));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, GetObjectByTag("cut1_glim"));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, GetObjectByTag("cut1_lafontaine"));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, GetObjectByTag("q2amhaere"));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, GetObjectByTag("cut1_parley"));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, GetObjectByTag("x2_hen_deekin"));


}
