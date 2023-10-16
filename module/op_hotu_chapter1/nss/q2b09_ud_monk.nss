//::///////////////////////////////////////////////
//:: Cursed monk User Defined
//:: q2b09_ud_monk
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cause monk to speak one liner when he sees a PC
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
