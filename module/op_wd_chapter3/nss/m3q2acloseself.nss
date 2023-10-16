//::///////////////////////////////////////////////
//:: M3Q2ACloseSelf.Nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Every six heartbeats, this door will close itself, if open
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
    if (GetIsOpen(OBJECT_SELF) == TRUE)
    {
        int nCount = GetLocalInt(OBJECT_SELF, "NW_L_COUNT");
        nCount ++;

        if (nCount >= 6)
        {
         nCount = 0;
         ActionCloseDoor(OBJECT_SELF);
        }
        SetLocalInt(OBJECT_SELF, "NW_L_COUNT", nCount);

    }
}
