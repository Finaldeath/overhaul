int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q5A09Staff")))
    {
        if (GetLocalInt(OBJECT_SELF,"LShownHeirloomStaff") == 1)
        {
            if (GetLocalInt(OBJECT_SELF,"LStaffGiven") < 1 ||
                GetLocalInt(OBJECT_SELF,"LStaffSold") < 1)
            {
                return TRUE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}
