//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GurdTakeJour
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    G'urdach takes Deltagar's journal.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q06IDELTAJOUR"),GetPCSpeaker());
}
