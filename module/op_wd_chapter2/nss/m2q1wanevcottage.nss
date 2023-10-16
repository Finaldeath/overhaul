//::///////////////////////////////////////////////
//:: Entered
//:: M2Q1WANEVCOTTAGE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This trigger uses an invisible object to
    display a string the first time a PC enters.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: February 20, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEnter = GetEnteringObject();
    object oSpeaker = GetObjectByTag("M2Q1N_SPEAKER");

    if (GetIsPC(oEnter))
    {
        AssignCommand(oSpeaker,SpeakOneLinerConversation());
        DestroyObject(OBJECT_SELF);
    }
}
