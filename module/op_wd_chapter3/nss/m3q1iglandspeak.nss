//::///////////////////////////////////////////////
//:: Igland Speak
//:: m3q1IglandSpeak.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Make Igland initiate dialog with the player when the trigger is crossed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetEnteringObject()) == TRUE)
    {
       SetLocalInt(GetObjectByTag("Igland3Q11"),"NW_I_WAS_TRIGGERED_TO_TALK",10);
       AssignCommand(GetObjectByTag("Igland3Q11"),ActionStartConversation(GetEnteringObject()));
       DestroyObject(OBJECT_SELF);
    }
}
