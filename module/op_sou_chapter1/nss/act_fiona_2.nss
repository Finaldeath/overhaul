//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fiona gives sword to PC and marks as done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
void CreateSword(object oPC);
void main()
{
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    //set local to sword given
    SetLocalInt(oPC,"X1_PIPERSWORD",20);
    //have Fiona move to back of room and play
    //"get item" animation Then go back to player
    ActionMoveToObject(GetObjectByTag("q1pawnchest"));
    DelayCommand(2.0, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.5));
    DelayCommand(3.5, ActionMoveToObject(oPC));
    DelayCommand(5.0, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.5));
    //give sword to PC
    DelayCommand(5.5, CreateSword(oPC));
    DelayCommand(6.0, ActionResumeConversation());
}

void CreateSword(object oPC)
{
    CreateItemOnObject("q1bpipersword",oPC);
}

