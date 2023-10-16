//::///////////////////////////////////////////////
//:: Name con_q2crak_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    check to see if the PC is carrying the activation
    stone.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:July 4/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oStone = GetItemPossessedBy(oPC, "q2cstone");
    if (GetIsObjectValid(oStone) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "oStone", oStone);
        return TRUE;
    }
    return FALSE;
}
