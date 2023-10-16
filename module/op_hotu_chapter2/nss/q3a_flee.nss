//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Generic Flee (Action Script)
//:: Q3a_Flee.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The NPC flees from PCSpeaker.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    ActionMoveAwayFromObject(oPC, FALSE, 80.0);
}
