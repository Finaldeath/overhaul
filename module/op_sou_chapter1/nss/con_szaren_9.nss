//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has the Dragon's Tooth
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oTooth = GetItemPossessedBy(oPC,"x1dragontooth");
    if (GetIsObjectValid(oTooth) == TRUE)
    {
        SetLocalObject(OBJECT_SELF,"DRAGONTOOTH",oTooth);
        return TRUE;
    }
    return FALSE;
}
