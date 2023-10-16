//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has nothing in his chest slot
    (no armor or clothing)
    25% chance of going down to next priority
    Also checks that Formosa not dead
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: april 23, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=2))
    {
        int roll=d100();
        if (roll>33)
        {
            object oItem=GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker());
            if(!GetIsObjectValid(oItem))
            {
                if(GetLocalInt(GetModule(),"NW_G_M1Q3AFormosa_Dead") == FALSE)
                {
                    return TRUE;
                }
                return FALSE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}


