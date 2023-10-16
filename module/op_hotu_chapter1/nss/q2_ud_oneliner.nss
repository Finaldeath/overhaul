//::///////////////////////////////////////////////
//:: User Defined Speak One Liner script
//:: q2_ud_oneliner
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cause Creature to speak one liner when he sees a PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 24, 2002
//:://////////////////////////////////////////////
void main()
{
    if (GetUserDefinedEventNumber() == 1002)
    {
        SpeakOneLinerConversation();
    }

}
