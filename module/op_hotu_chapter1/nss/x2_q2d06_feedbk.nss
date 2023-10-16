//::///////////////////////////////////////////////
//:: x2_q2d06_feedbk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Displays the response for door at q2d06.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "nDoorBlocked",1);
    SpeakOneLinerConversation();
    ActionDoCommand(SetLocalInt(OBJECT_SELF, "nDoorBlocked",0));

}
