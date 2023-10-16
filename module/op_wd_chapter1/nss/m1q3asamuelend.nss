void main()
{
    object oPC = GetPCSpeaker();

    if(GetLocalInt(GetModule(),"NW_Thurin_Plot") >= 100)
    {
        AddJournalQuestEntry("m1q3_Samuel", 40, oPC);
        ActionForceMoveToObject(GetNearestObjectByTag("M1Q3B_M1Q3A"));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
    }
}
