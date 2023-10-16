//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6YeanTakeJour
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Yeanasha takes Eltuth's journal.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q06IELTUTHJOUR"),GetPCSpeaker());
    CreateItemOnObject("M2Q06IFEATHERTOK",GetPCSpeaker());
}
