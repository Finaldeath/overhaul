//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has the Tower Statue
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oTower = GetItemPossessedBy(oPC,"x1tower");
    if (GetIsObjectValid(oTower) == TRUE)
    {
        SetLocalObject(OBJECT_SELF,"TOWERSTATUE",oTower);
        return TRUE;
    }
    return FALSE;
}
