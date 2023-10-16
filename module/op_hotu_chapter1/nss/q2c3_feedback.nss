//::///////////////////////////////////////////////
//:: q2c3_feedback.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Displays the standard response to a plot door
  being unable to be opened.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith
//:: Created On:  Nov 6/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetClickingObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",10) ;
    SpeakOneLinerConversation();
    ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",0));

}
