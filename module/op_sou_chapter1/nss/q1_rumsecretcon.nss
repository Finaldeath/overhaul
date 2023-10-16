//::///////////////////////////////////////////////
//:: q1_rumsecretcon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Has a conversation start with a placeable object
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    if (GetLocalInt(oPC, "X1_Q1RUMGUTCAPTUREPC") == 1)
        ActionStartConversation(oPC);
    else
        SpeakStringByStrRef(40304);
}
