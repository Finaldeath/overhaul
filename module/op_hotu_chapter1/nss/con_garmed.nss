//::///////////////////////////////////////////////
//:: Naked
//:: con_armed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has nothing in his right-hand slot
    25% chance of going down to next priority
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        int roll=d100();
        if (roll>33)
        {
            object oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,GetPCSpeaker());
            if(GetIsObjectValid(oItem))
            {
                return TRUE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}
