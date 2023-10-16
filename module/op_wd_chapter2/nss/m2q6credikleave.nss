//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6CredikLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Credik gives the PC his key and leaves the area.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 7, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q06ICREDIKKEY"),GetPCSpeaker());
    ActionMoveToObject(GetObjectByTag("M2Q6GtoM2Q6F"),TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
