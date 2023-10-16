//::///////////////////////////////////////////////
//:: Take Fairy Dust From player
//:: q2d03_adddust
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take one part of fairy dust from the PC and
    add it to the barrel.  Set the custom toke 2103
    to be how much dust is in the barrle
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 27, 2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    int nFound = FALSE;
    while (nFound == FALSE)
    {
        if (GetTag(oItem) == "q2b03FairyDust")
        {
            SetLocalInt(OBJECT_SELF,"nPartsDust",GetLocalInt(OBJECT_SELF,"nPartsDust") + 1);
            SetCustomToken(2103,IntToString(GetLocalInt(OBJECT_SELF,"nPartsDust")));
            nFound = TRUE;
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(oPC);
    }


}
