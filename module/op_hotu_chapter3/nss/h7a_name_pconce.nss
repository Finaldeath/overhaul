//::///////////////////////////////////////////////
//:: The Knower of Names, PC's Name Do Once (Action Script)
//:: H7a_Name_PCOnce.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as asking for his True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bKnower_PlayerHasAskedHisNameOnce", TRUE);
}
