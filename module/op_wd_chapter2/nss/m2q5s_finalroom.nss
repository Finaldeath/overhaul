//::///////////////////////////////////////////////
//:: Entered
//:: m2q5s_FinalRoom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Upon entering the Final Room in Mutamin's
    Challenge, a voice notifies the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oVoice = GetObjectByTag("M2Q5S_VOICE");
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered))
    {
        AssignCommand(oVoice,ActionStartConversation(OBJECT_SELF));
        DestroyObject(OBJECT_SELF);
    }
}
