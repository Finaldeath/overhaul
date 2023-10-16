//::///////////////////////////////////////////////
//:: Catapult!: OnUsed Script
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Launch the controlling conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();

    if (!IsInConversation(OBJECT_SELF))
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        ActionStartConversation(oPC);
    }
    else
    {
        SpeakStringByStrRef(85730, TALKVOLUME_TALK);//"This catapult is already in use."
    }
}
