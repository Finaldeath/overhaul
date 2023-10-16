//::///////////////////////////////////////////////
//:: Name q2a_use_wrack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      When the weapons rack/chest in your initial room is
      first used by the Hero - add journal entry 'awakenings' 20
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 14/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    if (GetLocalInt(OBJECT_SELF, "nTalkedToPC") == 0 )
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        ActionStartConversation(oPC);

    }




}
