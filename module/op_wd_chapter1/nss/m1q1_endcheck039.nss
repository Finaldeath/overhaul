//::///////////////////////////////////////////////
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has a weapon in hand
    25% chance of going down to next priority
    Checks if Blacklake plot done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(GetModule(),"NW_G_M1Q3MainPlot")==100))
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


