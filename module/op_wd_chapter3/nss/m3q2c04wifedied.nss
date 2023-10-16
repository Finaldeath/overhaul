//::///////////////////////////////////////////////
//:: Farm Wife Dies
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If wife is dead then update the journal.
    First looks for a valid 'escort'.
    If none is found it then looks for the first object
    with Bret's ring.  If that object is a PC, she updates
    his/her journal.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November
//:://////////////////////////////////////////////


void main()
{
    object oUpdate = OBJECT_INVALID;
    object oTest = GetLocalObject(GetModule(),"M3Q00OBRETFAMILY");

    if (GetIsObjectValid(oTest) == TRUE)
    {
        oUpdate = oTest;
    }
    else
    {
        oUpdate = GetItemPossessor(GetObjectByTag("M3Q2A10BRETBAND"));
    }
    if (GetIsObjectValid(oUpdate) == FALSE)
    {
        return;
    }
    AddJournalQuestEntry("M3Q2_A10_BRET",99, oUpdate);
}
