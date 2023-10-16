//::///////////////////////////////////////////////
//:: M2Q2A_GIVEKEY.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives the key to the barracks to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF, "M2Q2JKEY");
    if (GetIsObjectValid(oKey))
    {
        ActionPauseConversation();
        ActionGiveItem(oKey, GetPCSpeaker());
        ActionResumeConversation();
    }
/*    else
    {

    }*/
}
