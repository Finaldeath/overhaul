//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Initialization Script
//:: WW1_Mem_Init.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Initializes any tokens required by the
     memorial (to prevent "UNRECOGNIZED TOKEN"
     errors).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

void main()
{
    int iBeginningComplete = GetLocalInt(OBJECT_SELF, "iBeginningComplete");
    int iMiddleComplete = GetLocalInt(OBJECT_SELF, "iMiddleComplete");
    int iEndComplete = GetLocalInt(OBJECT_SELF, "iEndComplete");
    int iNameComplete = GetLocalInt(OBJECT_SELF, "iNameComplete");

    if (iBeginningComplete == 0)
    {
        SetCustomToken(9385, "");
    }
    if (iMiddleComplete == 0)
    {
        SetCustomToken(9386, "");
    }
    if (iEndComplete == 0)
    {
        SetCustomToken(9387, "");
        SetCustomToken(9389, "The message trails off, apparently unfinished.");
    }
    else
    {
        SetCustomToken(9389, "");
    }
    if (iNameComplete == 0)
    {
        SetCustomToken(9388, "");
    }
}
