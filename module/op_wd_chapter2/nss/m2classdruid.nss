//::///////////////////////////////////////////////
//:: Conversation
//:: m2ClassDruid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the PC is a druid.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 21, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();

    iResult = GetClassByPosition(1,oPC) == CLASS_TYPE_DRUID ||
              GetClassByPosition(2,oPC) == CLASS_TYPE_DRUID ||
              GetClassByPosition(3,oPC) == CLASS_TYPE_DRUID;
    return iResult;
}
