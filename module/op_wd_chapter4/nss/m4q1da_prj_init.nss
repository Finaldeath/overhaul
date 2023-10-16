//::///////////////////////////////////////////////
//:: M4Q1DA_PRJ_INIT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the morag projection to start conversation.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetEnteringObject()))
    {
        object oPC = GetEnteringObject();
        object oMorag = GetObjectByTag("M4Q01D07MORA");
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oMorag,ActionStartConversation(GetNearestObjectByTag("M4Q1D07_CLERIC")));
    }
}
