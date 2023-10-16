//::///////////////////////////////////////////////
//:: Sensei Dharvana, Door (Condition Script)
//:: H2c_Sensei_Door.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the conversation is held by
     a door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 11, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iObjectType = GetObjectType(OBJECT_SELF);
    if (iObjectType == OBJECT_TYPE_DOOR)
    {
        return TRUE;
    }
    return FALSE;
}

