//::///////////////////////////////////////////////
//:: Take Fairy Dust From player
//:: q2d03_addale
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take one part of Dwarven Ale from the PC and
    add it to the barrel.  Set the custom toke 2102
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
        if (GetTag(oItem) == "q2b03Ale")
        {
            SetLocalInt(OBJECT_SELF,"nJugsAle",GetLocalInt(OBJECT_SELF,"nJugsAle") + 1);
            SetCustomToken(2102,IntToString(GetLocalInt(OBJECT_SELF,"nJugsAle")));
            nFound = TRUE;
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(oPC);
    }



}
