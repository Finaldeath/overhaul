//::///////////////////////////////////////////////
//:: Captian Islund's Greeting
//:: 2Q6A_CaptGreet
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Captain Islund greets the PC and asks for
    documents
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nGreet = GetLocalInt(OBJECT_SELF, "NW_2Q6_ISLUND_GREET");
    int nHostile = GetLocalInt(OBJECT_SELF, "NW_2Q6_ISLUND_MAD");

    if(nGreet == 0 && nHostile == 0)
    {
        SetLocalInt(OBJECT_SELF, "NW_2Q6_ISLUND_GREET", 1);
        return TRUE;
    }
    return FALSE;
}
