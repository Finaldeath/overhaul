//::///////////////////////////////////////////////
//:: Name q2a_ent_housemae
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Fail To Open of the House maeviir door.
    You must get the key from the daughter before
    you are let in..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 22/03
//:://////////////////////////////////////////////

void main()
{
    object oGuard1 = GetObjectByTag("q2ahouseguard1");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oGuard1);
    AssignCommand(oGuard1, ActionStartConversation(oPC));
}
