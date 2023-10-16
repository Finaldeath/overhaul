//::///////////////////////////////////////////////
//:: Opened or Death
//:: m2q3HellChest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the chest is opened or destroyed, the
    door to the hell hounds opens.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 7, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_HellChest") == 0)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_HellChest",10);
        SignalEvent(GetObjectByTag("M2Q03DHELLDOOR"),EventUserDefined(300));
    }
}
